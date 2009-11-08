module WebIDL
  module Ast
    class Attribute < Node

      attr_reader :type, :name, :getraises, :setraises
      attr_accessor :extended_attributes, :stringifier

      def initialize(parent, type, name, opts = {})
        super(parent)

        @type                = type
        @name                = name
        @readonly            = !!opts[:readonly]
        @setraises           = opts[:setraises] || []
        @getraises           = opts[:getraises] || []
        @extended_attributes = opts[:extended_attributes] || []
      end

      def readonly?
        @readonly
      end

      def stringifier?
        !!@stringifier
      end

    end # Attribute
  end # Ast
end # WebIDL