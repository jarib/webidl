module WebIDL
  module Ast
    class Sequence < Node
      attr_reader :type

      def initialize(parent, type, opts = {})
        super(parent)

        @type = type
        @nullable = !!opts[:nullable]
      end

      def nullable?
        @nullable
      end

    end # Sequence
  end # Ast
end # WebIDL
