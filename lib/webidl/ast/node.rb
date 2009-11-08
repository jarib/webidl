module WebIDL
  module Ast
    class Node

      def initialize(parent = nil)
        @parent = parent
      end

      def qualified_name
        return unless @name

        if @parent.respond_to?(:qualified_name)
          "#{@parent.qualified_name}::#{@name}"
        else
          "::#{@name}"
        end
      end

    end # Node
  end # Ast
end # WebIDL