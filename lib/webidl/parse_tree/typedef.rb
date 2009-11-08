module WebIDL
  module ParseTree
    class TypeDef < Treetop::Runtime::SyntaxNode

      def build(parent)
        Ast::TypeDef.new(parent, type.text_value, name.text_value)
      end

    end # TypeDef
  end # ParseTree
end # WebIDL