module WebIDL
  module Ast
    class Exception < Node
      attr_reader :name
      attr_accessor :members, :extended_attributes, :inherits

      def initialize(parent, name)
        @parent  = parent
        @name    = name
        @members = []
        @inherits = []
        @extended_attributes = []
      end

    end # Exception
  end # Ast
end # WebIDL