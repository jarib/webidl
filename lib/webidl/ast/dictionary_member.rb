module WebIDL
  module Ast
    class DictionaryMember < Node

      attr_reader :type, :name, :default_value

      def initialize(parent, type, name, default_value)
        super(parent)
        @type, @name, @default_value = type, name, default_value
      end

    end # Field
  end # Ast
end # WebIDL