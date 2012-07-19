module WebIDL
  module Ast
    class Callback < Node
      
      attr_reader :name, :return_type, :arguments
      attr_accessor :extended_attributes

      def initialize(name, return_type, arguments)
        @name        = name
        @return_type = return_type
        @arguments   = arguments
      end

    end # Operation
  end # Ast
end # WebIDL
