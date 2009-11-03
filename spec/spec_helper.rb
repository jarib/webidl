$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "rubygems"
require 'webidl'
require "ruby-debug"
require 'spec'
require 'spec/autorun'
require "pp"

module ParseHelper
  def parse(input)
    result = @parser.parse(input)

    unless result
      raise @parser.failure_reason
    end

    result
  end

  def fixture(name)
    File.read("#{File.dirname(__FILE__)}/fixtures/#{name}")
  end
end

Spec::Runner.configure do |c|
  c.include(ParseHelper)
  c.before(:each) do
    @parser = WebIDLParser.new
  end
end