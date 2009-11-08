module WebIDL
  module Ast
    class Field < Node

      attr_reader :type, :name

      def initialize(parent, type, name)
        super(parent)
        @type, @name = type, name
      end

    end # Field
  end # Ast
end # WebIDL