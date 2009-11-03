module WebIDL
  module Ast
    class Definitions < Node
      include Enumerable

      attr_reader :extended_attributes

      def initialize(extended_attributes, definitions)
        @extended_attributes = extended_attributes
        @definitions         = definitions
      end

      def each(&blk)
        @definitions.each(&blk)
      end

    end # Definitions
  end # Ast
end # WebIDL