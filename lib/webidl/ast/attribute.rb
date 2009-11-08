module WebIDL
  module Ast
    class Attribute < Node

      attr_reader :type, :name, :getraises, :setraises
      attr_accessor :extended_attributes

      def initialize(parent, type, name, opts = {})
        super(parent)

        @type                = type
        @name                = name
        @readonly            = !!opts[:readonly]
        @setraises           = opts[:setraises] || []
        @getraises           = opts[:getraises] || []
        @extanded_attributes = opts[:extanded_attributes] || []
      end

      def readonly?
        @readonly
      end

    end # Attribute
  end # Ast
end # WebIDL