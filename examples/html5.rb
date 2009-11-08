$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', "lib")

require "rubygems"
require "webidl"

puts WebIDL::Generator.new.generate(File.read("#{File.dirname(__FILE__)}/../spec/fixtures/html5.idl"))