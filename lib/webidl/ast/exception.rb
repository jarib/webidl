module WebIDL
  module Ast
    class Exception < Node
      attr_reader :name
      attr_accessor :members, :extended_attributes

      def initialize(parent, name)
        @parent  = parent
        @name    = name
        @members = []
        @extended_attributes = []
      end

    end # Exception
  end # Ast
end # WebIDL