module WebIDL
  module Ast
    class Argument < Node

      attr_reader :name, :type

      def initialize(name, type, opts = {})
        @name = name
        @type = type

        @optional = !!opts[:optional]
        @variadic = !!opts[:variadic]
      end

      def optional?
        @optional
      end

      def variadic?
        @variadic
      end

    end # Argument
  end # Ast
end # WebIDL