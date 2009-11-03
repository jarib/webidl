module WebIDL
  module Ast
    class Module < Node

      def initialize(name, definitions)
        @name        = name
        @definitions = definitions
      end

    end # Attribute
  end # Ast
end # WebIDL