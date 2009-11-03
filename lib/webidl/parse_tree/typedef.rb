module WebIDL
  module ParseTree
    class TypeDef < Treetop::Runtime::SyntaxNode

      def build
        Ast::TypeDef.new(type.text_value, name.text_value)
      end

    end # TypeDef
  end # ParseTree
end # WebIDL