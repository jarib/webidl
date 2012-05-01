module WebIDL
  module ParseTree
    class Enum < Treetop::Runtime::SyntaxNode

      def build(parent)
        Ast::Enum.new(parent, id.text_value, values.build)
      end

    end # Enum
  end # ParseTree
end # WebIDL
