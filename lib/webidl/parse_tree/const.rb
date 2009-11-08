module WebIDL
  module ParseTree
    class Const < Treetop::Runtime::SyntaxNode
      def build(parent)
        Ast::Const.new(parent, type.build(parent), name.text_value, const_expr.build)
      end
    end # Const
  end # ParseTree
end # WebIDL