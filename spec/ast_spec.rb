require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Ast do

  #
  # modules
  #

  it "creates a module" do
    result = parse(fixture("simple_module.idl")).build

    result.should be_kind_of(Array)
    result.size.should == 1

    result.first.should be_kind_of(WebIDL::Ast::Module)
  end

  it "creates a module with a typedef" do
    mod = parse(fixture("module_with_typedef.idl")).build.first

    mod.definitions.should be_kind_of(Array)

    typedef = mod.definitions.first
    typedef.should be_kind_of(WebIDL::Ast::TypeDef)

    typedef.type.should == 'DOMString'
    typedef.name.should == 'string'
  end

  it "creates a module with an extended attribute (no args)" do
    mod = parse(fixture("module_with_xattr_no_arg.idl")).build.first
    mod.should be_kind_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.size.should == 1

    xattrs.first.should be_kind_of(WebIDL::Ast::ExtendedAttribute)
    xattrs.first.name.should == 'OverrideBuiltins'
  end

  it "creates a module with extended attribute (two args)" do
    mod = parse(fixture("module_with_xattr_two_args.idl")).build.first
    mod.should be_kind_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.size.should == 1

    xattr = xattrs.first

    xattr.should be_kind_of(WebIDL::Ast::ExtendedAttribute)
    xattr.name.should == 'Constructor'

    xattr.args.size.should == 2
    xattr.args.should be_kind_of(Array)
    xattr.args.each { |a| a.should be_kind_of(WebIDL::Ast::Argument)  }
  end

  it "creates a module with extended attribute (named args)" do
    mod = parse(fixture("module_with_xattr_named_args.idl")).build.first
    mod.should be_kind_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.should be_kind_of(Array)

    xattr = xattrs.first
    xattr.should be_kind_of(Array) # TODO: review this

    xattr.first.should == 'NamedConstructor'
    xattr.last.should be_kind_of(WebIDL::Ast::ExtendedAttribute)
  end

  it "creates a module with extended attribute (ident)" do
    mod = parse(fixture("module_with_xattr_ident.idl")).build.first
    mod.should be_kind_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.should be_kind_of(Array)

    xattr = xattrs.first
    xattr.should be_kind_of(Array) # TODO: review this

    xattr.first.should == 'PutForwards'
    xattr.last.should == "name"
  end

  it "creates a module with extended attribute (scoped name)" do
    mod = parse(fixture("module_with_xattr_scoped.idl")).build.first
    mod.should be_kind_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.should be_kind_of(Array)

    xattr = xattrs.first
    xattr.should be_kind_of(Array) # TODO: review this

    xattr.first.should == 'Prefix'
    xattr.last.should be_kind_of(WebIDL::Ast::ScopedName)
  end

  #
  # interfaces
  #

  it "creates a simple interface" do
    result = parse(fixture("simple_interface.idl")).build

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

  # it "creates a the framework example from the WebIDL spec" do
  #   interface = parse(fixture("framework.idl")).build.first
  # end


  #
  # various
  #

  it "creates an exception" do
    interface = parse(fixture("module_with_exception.idl")).build.first
    debugger
    nil
  end


  it "creates an attribute"

end
