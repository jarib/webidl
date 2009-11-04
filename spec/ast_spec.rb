require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Ast do

  #
  # modules
  #

  it "creates a module" do
    result = parse(fixture("simple_module.idl")).build

    result.should be_instance_of(Array)
    result.size.should == 1

    result.first.should be_instance_of(WebIDL::Ast::Module)
  end

  it "creates a module with a typedef" do
    mod = parse(fixture("module_with_typedef.idl")).build.first

    mod.definitions.should be_instance_of(Array)

    typedef = mod.definitions.first
    typedef.should be_instance_of(WebIDL::Ast::TypeDef)

    typedef.type.should == 'DOMString'
    typedef.name.should == 'string'
  end

  it "creates a module with an extended attribute (no args)" do
    mod = parse(fixture("module_with_xattr_no_arg.idl")).build.first
    mod.should be_instance_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.size.should == 1

    xattrs.first.should be_instance_of(WebIDL::Ast::ExtendedAttribute)
    xattrs.first.name.should == 'OverrideBuiltins'
  end

  it "creates a module with extended attribute (two args)" do
    mod = parse(fixture("module_with_xattr_two_args.idl")).build.first
    mod.should be_instance_of(WebIDL::Ast::Module)

    xattrs = mod.extended_attributes
    xattrs.size.should == 1

    xattr = xattrs.first

    xattr.should be_instance_of(WebIDL::Ast::ExtendedAttribute)
    xattr.name.should == 'Constructor'

    xattr.args.size.should == 2
    xattr.args.each { |a| a.should be_instance_of(WebIDL::Ast::Argument)  }
  end

  it "creates a module with extended attribute (named args)"

  it "creates a module with extended attribute (ident)"

  it "creates a module with extended attribute (scoped name)"

  #
  # interfaces
  #

  it "creates a simple interface" do
    result = parse(fixture("simple_interface.idl")).build

    result.should be_instance_of(Array)
    result.size.should == 1

    interface = result.first
    interface.should be_instance_of(WebIDL::Ast::Interface)
    interface.name.should == "System"
  end

  it "creates an interface with members" do
    interface = parse(fixture("interface_with_members.idl")).build.first
    interface.should be_instance_of(WebIDL::Ast::Interface)
  end

end
