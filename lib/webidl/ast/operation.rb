module WebIDL
  module Ast
    class Operation < Node

      attr_reader :type, :name, :args, :specials, :raises
      attr_accessor :extended_attributes, :stringifier

      def initialize(parent, type, opts = {})
        @parent              = parent
        @type                = type
        @name                = opts[:name]                || ''
        @static              = opts[:static]
        @specials            = opts[:specials]            || []
        @args                = opts[:args]                || []
        @raises              = opts[:raises]              || []
        @extended_attributes = opts[:extended_attributes] || []
      end

      def stringifier?
        !!@stringifier
      end

      def getter?
        @specials.include? 'getter'
      end

      def setter?
        @specials.include? 'setter'
      end

      def creator?
        @specials.include? 'creator'
      end

      def deleter?
        @specials.include? 'deleter'
      end

      def legacycaller?
        @specials.include? 'legacycaller'
      end

      def static?
        !!@static
      end

    end # Operation
  end # Ast
end # WebIDL
