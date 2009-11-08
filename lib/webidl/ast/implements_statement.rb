module WebIDL
  module Ast
    class ImplementsStatement < Node

      attr_reader :implementor, :implementee

      def initialize(parent, implementor_name, implementee_name)
        @implementor = implementor_name
        @implementee = implementee_name
      end

    end # ImplementsStatement
  end # Ast
end # WebIDL