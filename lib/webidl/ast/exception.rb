module WebIDL
  module Ast
    class Exception < Node
      attr_reader :name
      attr_accessor :members

      def initialize(parent, name)
        @parent  = parent
        @name    = name
        @members = []
      end

    end # Exception
  end # Ast
end # WebIDL