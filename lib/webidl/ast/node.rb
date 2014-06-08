module WebIDL
  module Ast
    class Node

      attr_reader :parent

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
        visitor.send("visit_#{snake_name}", self, &blk)
      end

      def snake_name
        self.class.name.split("::").last.snake_case
      end

    end # Node
  end # Ast
end # WebIDL
