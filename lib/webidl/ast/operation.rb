module WebIDL
  module Ast
    class Operation < Node

      attr_reader :type, :name, :args, :specials, :raises

      def initialize(parent, type, opts = {})
        @parent   = parent
        @type     = type
        @name     = opts[:name]      || '(unknown)'
        @specials = opts[:specials] || []
        @args     = opts[:args]     || []
        @raises   = opts[:raises]   || []
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

      def caller?
        @specials.include? 'caller'
      end

    end # Operation
  end # Ast
end # WebIDL