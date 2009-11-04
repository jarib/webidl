module WebIDL
  module Ast
    class Interface

      attr_reader :name, :members, :inherits

      def initialize(name, members = [], inherits = nil )
        @name = name
        @members = members
        @inherits = inherits
      end

    end
  end # Ast
end # WebIDL