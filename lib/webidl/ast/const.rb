module WebIDL
  module Ast
    class Const

      attr_reader :type, :name, :value

      def initialize(type, name, value)
        @type  = type
        @name  = name
        @value = value
      end

    end # Type
  end # Ast
end # WebIDL