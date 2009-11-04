module WebIDL
  module ParseTree
    class NullableType < Treetop::Runtime::SyntaxNode

      def build
        Ast::Type.new type.text_value, :nullable => null.any?
      end

    end # NullableType
  end # ParseTree
end # WebIDL