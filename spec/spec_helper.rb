require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "rubygems"
require 'webidl'
require 'rspec'
require "pp"

# require "ruby-debug"
# Debugger.start
# Debugger.settings[:autoeval] = true
# Debugger.settings[:autolist] = 1

module ParseHelper
  def parse(input)
    result = @parser.parse(input)

    unless result
      raise @parser.failure_reason
    end

    result
  end

  def generate(str)
    generator.generate(str)
  end

  def generator
    @generator ||= WebIDL::Generator.new
  end

  def fixture(name)
    File.read("#{File.dirname(__FILE__)}/fixtures/#{name}")
  end
end

RSpec.configure do |c|
  c.include(ParseHelper)
  c.before(:each) do
    @parser = WebIDL::Parser::IDLParser.new
  end
end