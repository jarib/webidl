module WebIDL
  module Ast
    class Const < Node

      attr_reader :type, :name, :value

      def initialize(parent, type, name, value)
        super(parent)

        @type  = type
        @name  = name
        @value = value
      end

    end # Type
  end # Ast
end # WebIDL