module WebIDL
  module ParseTree
    class ExceptionField < Treetop::Runtime::SyntaxNode

      def build
        [type.build, id.text_value]
      end

    end # ExceptionField
  end # ParseTree
end # WebIDL