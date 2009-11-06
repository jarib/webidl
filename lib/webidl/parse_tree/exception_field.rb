module WebIDL
  module ParseTree
    class ExceptionField < Treetop::Runtime::SyntaxNode

      def build
        raise NotImplementedError
      end

    end # ExceptionField
  end # ParseTree
end # WebIDL