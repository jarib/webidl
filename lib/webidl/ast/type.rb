module WebIDL
  module Ast
    class Type

      attr_reader :name

      def initialize(name, opts = {})
        @name     = name.strip.to_sym
        @nullable = !!opts[:nullable]
      end

      def nullable?
        @nullable
      end

    end # Type
  end # Ast
end # WebIDL