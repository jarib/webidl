module WebIDL
  module ParseTree
    class ExceptionField < Treetop::Runtime::SyntaxNode

      def build(parent)
        Ast::Field.new(parent, type.build(parent), id.text_value)
      end

    end # ExceptionField
  end # ParseTree
end # WebIDL