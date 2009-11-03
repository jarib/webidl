require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Parser::IDLParser do
  it "parses a simple module" do
    result = parse fixture("simple_module.idl")
    result.should_not be_nil

    definitions = result.build.to_a
    definitions.should be_instance_of(Array)
    definitions.first.should be_instance_of(WebIDL::Ast::Module)
  end

  it "parses a simple interface" do
    result = parse fixture("simple_interface.idl")
    result.should_not be_nil
  end
  #
  # it "parses a module with several interfaces" do
  #   result = parse fixture("framework.idl")
  #   result.should_not be_nil
  # end
  #
  # it "parses a known type followed by other characters" do
  #   result = parse <<-IDL
  #     interface Foo { readonly attribute DOMStringMap bar;  };
  #   IDL
  #
  #   result.should_not be_nil
  # end
  #
  # it "parses the HTML5 DOM interface idl" do
  #   result = parse fixture("html5.idl")
  #   result.should_not be_nil
  # end
end
