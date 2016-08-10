require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Parser::IDLParser do

  #
  # dictionaries
  #

  it "parses an empty dictionary" do
    str = <<-IDL
      dictionary Foo {};
    IDL
    parse(str).should_not be_nil
  end

  it "parses dictionary members" do
    str = <<-IDL
      dictionary Foo { DOMString foo; };
    IDL
    parse(str).should_not be_nil
  end

  it "parses required dictionary members" do
    str = <<-IDL
      dictionary Foo { required DOMString foo; };
    IDL
    parse(str).should_not be_nil
  end

  #
  # promises
  #

  it "parses empty promises" do
    str = <<-IDL
      interface Asdf {
        Promise <DOMString> doSomething ();
      };
    IDL
    parse(str).should_not be_nil
  end

  it "parses promises with ws around return type" do
    str = <<-IDL
      interface Asdf {
        Promise < DOMString > doSomething ();
      };
    IDL
    parse(str).should_not be_nil
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

  it "parses the WebSocket interface idl" do
    parse(fixture("websocket.idl")).should_not be_nil
  end

  it "parses the HTML5 DOM interface idl" do
    parse(fixture("html5.idl")).should_not be_nil
  end

end
