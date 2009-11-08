require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Parser::IDLParser do

  #
  # modules
  #

  it "parses an empty module" do
    parse(fixture("empty_module.idl")).should_not be_nil
  end

  it "parses a module with a typedef" do
    parse(fixture("module_with_typedef.idl")).should_not be_nil
  end

  it "parses modules with extended attributes" do
    parse(fixture("module_with_xattr_ident.idl")).should_not be_nil
    parse(fixture("module_with_xattr_named_args.idl")).should_not be_nil
    parse(fixture("module_with_xattr_no_arg.idl")).should_not be_nil
    parse(fixture("module_with_xattr_scoped.idl")).should_not be_nil
    parse(fixture("module_with_xattr_two_args.idl")).should_not be_nil
  end

  #
  # interfaces
  #

  it "parses an empty interface" do
    parse(fixture("empty_interface.idl")).should_not be_nil
  end

  it "parses a module with several interfaces" do
    result = parse fixture("framework.idl")
    result.should_not be_nil
  end

  it "parses an interface with an attribute" do
    parse(fixture("interface_with_attribute.idl")).should_not be_nil
  end


  #
  # various
  #

  it "parses a known type followed by other characters" do
    str = <<-IDL
      interface Foo { readonly attribute DOMStringMap bar;  };
    IDL

    parse(str).should_not be_nil
  end

  it "parses the WebSocket interface idl" do
    parse(fixture("websocket.idl")).should_not be_nil
  end

  it "parses the HTML5 DOM interface idl" do
    parse(fixture("html5.idl")).build
    parse(fixture("html5.idl")).should_not be_nil
  end

end
