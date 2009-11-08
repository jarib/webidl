require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WebIDL::Generator do

  it "generates an empty module" do
    expected = %Q{module Gui\n  # do nothing\nend\n}
    actual   = generate(fixture('empty_module.idl'))

    actual.should == expected
  end

  it "generates an empty interface" do
    expected = %Q{module System\n  # do nothing\nend}
    actual   = generate(fixture('empty_interface.idl'))

    actual.should == expected
  end

  it "generates nested modules/interfaces" do
    expected = <<-RUBY
module Foo
  module Bar
    # do nothing
  end
  module Baz
    # do nothing
  end
end
RUBY

    actual = generate(fixture("nested.idl"))
    actual.should == expected
  end

  it "generates a module with an exception" do
    expected = <<-RUBY
module Framework
  class FrameworkException < StandardError
    ERR_NOT_FOUND = 1
    attr_accessor(:code)
  end
end
RUBY

    actual = generate(fixture('module_with_exception.idl'))
    actual.should == expected
  end

  it "generates an interface with attributes" do
    expected = <<-RUBY
module Foo
  attr_accessor(:const)
  attr_accessor(:value)
end
RUBY

    actual = generate(fixture('interface_with_attribute.idl'))
    actual.should == expected.strip
  end

  it "generates an interface with a member operation" do
    expected = <<-RUBY
module System
  def create_object(interface)
    raise(NotImplementedError)
  end
end
RUBY

    actual = generate(fixture("interface_with_members.idl"))
    actual.should == expected.strip
  end

  it "generates an implements statement" do
    expected = <<-RUBY
module Foo
  module Bar
    # do nothing
  end
  module Baz
    # do nothing
  end
  module Foo::Bar
    include(Foo::Baz)
  end
end
RUBY

    actual = generate(fixture("module_with_implements_statement.idl"))
    actual.should == expected
  end
end
