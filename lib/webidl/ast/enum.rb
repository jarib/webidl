module WebIDL
  module Ast
    class Enum < Node

      attr_reader :name, :values

      def initialize(parent, name, values)
        super(parent)

        @name = name
        @values = values
      end

    end # Enum
  end # Ast
end # WebIDL
