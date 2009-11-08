module WebIDL
  module Ast
    class Type < Node

      attr_reader :name

      def initialize(parent, name, opts = {})
        super(parent)

        @name     = name.strip.to_sym
        @nullable = !!opts[:nullable]
      end

      def nullable?
        @nullable
      end

    end # Type
  end # Ast
end # WebIDL