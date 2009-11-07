module WebIDL
  module ParseTree
    class Const < Treetop::Runtime::SyntaxNode
      def build
        Ast::Const.new(type.build, name.text_value, const_expr.build)
      end
    end # Const
  end # ParseTree
end # WebIDL