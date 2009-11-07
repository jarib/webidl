module WebIDL
  module Ast
    class Exception
      attr_reader :name, :members

      def initialize(name, members)
        @name    = name
        @members = members
      end
    end # Exception
  end # Ast
end # WebIDL