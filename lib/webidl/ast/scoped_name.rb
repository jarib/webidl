module WebIDL
  module Ast
    class ScopedName < Node

      attr_reader :name

      def initialize(parent, name, opts = {})
        super(parent)
        @name = name
        @relative = !!opts[:relative]
      end

      def qualified_name
        if relative?
          "#{@parent.qualified_name}::#{@name}"
        else
          @name
        end
      end

      def relative?
        @relative
      end

    end # ScopedName
  end # Ast
end # WebIDL