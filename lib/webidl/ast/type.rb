module WebIDL
  module Ast
    class Type

      def initialize(type, opts = {})
        @type     = type.to_sym
        @nullable = !!opts[:nullable]
      end

      def nullable?
        @nullable
      end

    end # Type
  end # Ast
end # WebIDL