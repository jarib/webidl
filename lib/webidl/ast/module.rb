module WebIDL
  module Ast
    class Module < Node

      attr_reader :name
      attr_accessor :extended_attributes, :definitions

      def initialize(parent, name)
        @parent              = parent
        @name                = name
        @definitions         = []
        @extended_attributes = []
      end

    end # Attribute
  end # Ast
end # WebIDL