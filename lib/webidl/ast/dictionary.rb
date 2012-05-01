module WebIDL
  module Ast
    class Dictionary < Node

      def self.list
        @list ||= {}
      end

      attr_reader :name
      attr_accessor :extended_attributes,
                    :members,
                    :inherits,
                    :partial

      def initialize(parent, name)
        super(parent)

        @name                = name
        @members             = []
        @inherits            = []
        @implements          = []
        @extended_attributes = []
        @partial             = false
      end

      def partial?
        @partial
      end

    end # Dictionary
  end # Ast
end # WebIDL