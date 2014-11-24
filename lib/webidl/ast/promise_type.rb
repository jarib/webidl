module WebIDL
  module Ast
    class PromiseType < Node

      attr_reader :return_type

      def initialize(return_type)
        @return_type = return_type
      end

    end # PromiseType
  end # Ast
end # WebIDL
