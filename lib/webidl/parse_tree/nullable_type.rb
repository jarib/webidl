module WebIDL
  module ParseTree
    class NullableType < Treetop::Runtime::SyntaxNode

      def build(parent)
        Ast::Type.new parent, type.text_value, :nullable => null.any?
      end

    end # NullableType
  end # ParseTree
end # WebIDL
