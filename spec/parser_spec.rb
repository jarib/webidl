require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Parser::IDLParser do

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

  it "parses array types" do
    str = <<-IDL
      interface Bar {
        readonly attribute short[] foo;
        readonly attribute short[ ] bar;
      };
    IDL

    parse(str).should_not be_nil
  end

  it "parses hex numbers" do
    str = <<-IDL
      interface Bar { const unsigned long NULL = 0x0000; };
    IDL

    parse(str).should_not be_nil
  end

  it "parses static types" do
    str = <<-IDL
      interface Bar { static DOMString createBar(); };
    IDL

    parse(str).should_not be_nil
  end

  it "parses a complex extended attribute argument list" do
    str = <<-IDL
      [Constructor,
       Constructor(Path2D path),
       Constructor(Path2D[] paths, CanvasFillRule fillRule = "nonzero"),
       Constructor(DOMString d), Exposed=Window,Worker]
       interface Path2D {       }
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
