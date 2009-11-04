require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Parser::IDLParser do

  #
  # modules
  #

  it "parses a simple module" do
    parse(fixture("simple_module.idl")).should_not be_nil
  end

  it "parses a module with a typedef" do
    parse(fixture("module_with_typedef.idl")).should_not be_nil
  end

  it "parses modules with extended attributes" do
    parse(fixture("module_with_xattr_no_arg.idl")).should_not be_nil
  end

  #
  # interfaces
  #

  it "parses a simple interface" do
    parse(fixture("simple_interface.idl")).should_not be_nil
  end

  it "parses a module with several interfaces" do
    result = parse fixture("framework.idl")
    result.should_not be_nil
  end

  #
  # various
  #

  it "parses a known type followed by other characters" do
    result = parse <<-IDL
      interface Foo { readonly attribute DOMStringMap bar;  };
    IDL

    result.should_not be_nil
  end

  it "parses the HTML5 DOM interface idl" do
    parse(fixture("html5.idl")).should_not be_nil
  end

end
