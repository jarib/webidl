module WebIDL
  module Ast
    class IncludesStatement < Node

      attr_reader :includer, :includee

      def initialize(parent, includer_name, includee_name)
        @includer = includer_name
        @includee = includee_name
      end

    end # IncludesStatement
  end # Ast
end # WebIDL
