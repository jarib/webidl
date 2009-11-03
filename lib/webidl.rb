require "treetop"
require "ruby2ruby"


require "webidl/parse_tree/definitions"
require "webidl/parse_tree/module"
require "webidl/parse_tree/attribute"
require "webidl/parse_tree/typedef"

require "webidl/ast/node"
require "webidl/ast/definitions"
require "webidl/ast/module"
require "webidl/ast/typedef"

require "webidl/parser/debug_helper"
require "webidl/parser/idl"
# Treetop.load("#{File.dirname(__FILE__)}/webidl/parser/idl")
