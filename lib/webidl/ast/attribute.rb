module WebIDL
  module Ast
    class Attribute

      attr_reader :type, :name, :getraises, :setraises

      def initialize(type, name, opts = {})
        @type      = type
        @name      = name
        @readonly  = !!opts[:readonly]
        @setraises = opts[:setraises] || []
        @getraises = opts[:getraises] || []
      end

      def readonly?
        @readonly
      end

    end # Attribute
  end # Ast
end # WebIDL