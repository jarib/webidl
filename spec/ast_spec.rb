require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Ast do

  it "creates a typedef" do
    definitions = parse(fixture("typedef.idl")).build

    definitions.should be_kind_of(Array)

    typedef = definitions.first
    typedef.should be_kind_of(WebIDL::Ast::TypeDef)

    typedef.type.should == 'DOMString'
    typedef.name.should == 'string'
    typedef.qualified_name.should == '::string'
  end

  it "creates an extended attribute (no args)" do
    intf = parse(fixture("xattr_no_arg.idl")).build.first
    intf.should be_kind_of(WebIDL::Ast::Interface)

    xattrs = intf.extended_attributes
    xattrs.size.should == 1

    xattrs.first.should be_kind_of(WebIDL::Ast::ExtendedAttribute)
    xattrs.first.name.should == 'OverrideBuiltins'
  end


  it "creates an extended attribute (two args)" do
    intf = parse(fixture("xattr_two_args.idl")).build.first
    intf.should be_kind_of(WebIDL::Ast::Interface)

    xattrs = intf.extended_attributes
    xattrs.size.should == 1

    xattr = xattrs.first

    xattr.should be_kind_of(WebIDL::Ast::ExtendedAttribute)
    xattr.name.should == 'Constructor'

    xattr.args.size.should == 2
    xattr.args.should be_kind_of(Array)
    xattr.args.each { |a| a.should be_kind_of(WebIDL::Ast::Argument)  }
  end

  it "creates extended attribute (named args)" do
    intf = parse(fixture("xattr_named_args.idl")).build.first
    intf.should be_kind_of(WebIDL::Ast::Interface)

    xattrs = intf.extended_attributes
    xattrs.should be_kind_of(Array)

    xattr = xattrs.first
    xattr.should be_kind_of(Array) # TODO: review this

    xattr.first.should == 'NamedConstructor'
    xattr.last.should be_kind_of(WebIDL::Ast::ExtendedAttribute)
  end

  it "creates an extended attribute (ident)" do
    intf = parse(fixture("xattr_ident.idl")).build.first
    intf.should be_kind_of(WebIDL::Ast::Interface)

    xattrs = intf.extended_attributes
    xattrs.should be_kind_of(Array)

    xattr = xattrs.first
    xattr.should be_kind_of(Array) # TODO: review this

    xattr.first.should == 'PutForwards'
    xattr.last.should == "name"
  end

  it "creates an extended attribute (scoped name)" do
    intf = parse(fixture("xattr_scoped.idl")).build.first
    intf.should be_kind_of(WebIDL::Ast::Interface)

    xattrs = intf.extended_attributes
    xattrs.should be_kind_of(Array)

    xattr = xattrs.first
    xattr.should be_kind_of(Array) # TODO: review this

    xattr.first.should == 'Prefix'
    xattr.last.should be_kind_of(WebIDL::Ast::ScopedName)
  end

  #
  # interfaces
  #

  it "creates an empty interface" do
    result = parse(fixture("empty_interface.idl")).build

    result.should be_kind_of(Array)
    result.size.should == 1

    interface = result.first
    interface.should be_kind_of(WebIDL::Ast::Interface)
    interface.name.should == "System"
  end

  it "creates an interface with members" do
    interface = parse(fixture("interface_with_members.idl")).build.first
    interface.should be_kind_of(WebIDL::Ast::Interface)

    interface.members.first.should be_kind_of(WebIDL::Ast::Operation)
  end

  it "creates an interface with stringifier members" do
    interface = parse(fixture("interface_with_stringifiers.idl")).build.first
    interface.should be_kind_of(WebIDL::Ast::Interface)

    interface.members.first.should be_kind_of(WebIDL::Ast::Attribute)
    interface.members.first.should be_stringifier

    interface.members.last.should be_kind_of(WebIDL::Ast::Operation)
    interface.members.last.should be_stringifier
  end

  it "creates an interface with inheritance" do
    interface = parse(fixture("interface_with_inheritance.idl")).build.last
    interface.inherits.should_not be_empty
    interface.inherits.first.qualified_name.should == "::foo"
  end

  it "creates an exception with inheritance" do
    exception = parse(fixture("exception_with_inheritance.idl")).build.last
    exception.inherits.should_not be_empty
    exception.inherits.first.name.should == "NotFoundException"
  end

  it "creates an interface with an array type member" do
    interface = parse(fixture("interface_with_array_member.idl")).build.first
    interface.should be_kind_of(WebIDL::Ast::Interface)

    attr = interface.members.first
    attr.should be_kind_of(WebIDL::Ast::Attribute)

    attr.type.should be_kind_of(WebIDL::Ast::Type)
    attr.type.name.should == :UnsignedShortArray
  end

  it "creates a framework from the example in the WebIDL spec" do
    definitions = parse(fixture("framework.idl")).build
    definitions.size.should == 4
    definitions.map { |e| e.class}.should == [
      WebIDL::Ast::TypeDef,
      WebIDL::Ast::Exception,
      WebIDL::Ast::Interface,
      WebIDL::Ast::Interface,
    ]

    interface = definitions[3]
    interface.name.should == 'TextField'
    interface.members.first.qualified_name.should == '::TextField::const' # or should it?
  end


  #
  # various
  #

  it "creates an exception" do
    ex = parse(fixture("exception.idl")).build.first

    ex.name.should == "FrameworkException"
    ex.qualified_name.should == '::FrameworkException'
    ex.members.size.should == 2

    xattr = ex.extended_attributes
    xattr.first.name.should == "Supplemental"

    first, last = ex.members

    first.should be_kind_of(WebIDL::Ast::Const)
    first.name.should == "ERR_NOT_FOUND"
    first.qualified_name.should == '::FrameworkException::ERR_NOT_FOUND'
    first.type.should be_kind_of(WebIDL::Ast::Type)
    first.type.name.should == :Long
    first.value.should == 1

    last.should be_kind_of(WebIDL::Ast::Field)
    last.type.should be_kind_of(WebIDL::Ast::Type)
    last.type.name.should == :Long
    last.name.should == "code"
  end


  it "creates an attribute" do
    interface = parse(fixture("interface_with_attribute.idl")).build.first
    first, last = interface.members

    first.should be_kind_of(WebIDL::Ast::Attribute)
    first.name.should == 'const'

    last.should be_kind_of(WebIDL::Ast::Attribute)
    last.name.should == 'value'
    last.type.name.should == :DOMString
    last.type.should be_nullable
  end

  it "creates a static operation" do
    interface = parse(fixture("interface_with_static_operation.idl")).build.first
    interface.members.first.should be_static
  end

  it "creates an implements statement" do
    definitions = parse(fixture("implements_statement.idl")).build

    definitions.first.should be_kind_of(WebIDL::Ast::Interface)

    impls = definitions.last
    impls.should be_kind_of(WebIDL::Ast::ImplementsStatement)
    impls.implementor.should == "::bar"
    impls.implementee.should == "::baz"
  end

  it 'creates a dictionary' do
    definitions = parse(fixture("dictionary.idl")).build
    dict        = definitions.first

    dict.should be_kind_of(WebIDL::Ast::Dictionary)
    dict.name.should == "HashChangeEventInit"

    dict.inherits.size.should == 1
    dict.inherits.first.name.should == "EventInit"

    dict.members.size.should == 2
    dict.members.map(&:name).should == %w[oldURL newURL]
    dict.members.map { |e| e.type.name }.should == [:DOMString, :DOMString]
  end

  it "builds an AST from the HTML5 spec" do
    parse(fixture("html5.idl")).build
  end

end
