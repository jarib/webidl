module WebIDL
  module Ast
    class Module < Node

      attr_reader :name, :definitions
      attr_accessor :extended_attributes

      def initialize(name, definitions)
        @name                = name
        @definitions         = definitions
        @extended_attributes = []
      end

    end # Attribute
  end # Ast
end # WebIDL