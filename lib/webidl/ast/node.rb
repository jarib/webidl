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

      def accept(visitor, &blk)
        visitor.send("visit_#{self.class.name.snake_case}", self, &blk)
      end

    end # Node
  end # Ast
end # WebIDL