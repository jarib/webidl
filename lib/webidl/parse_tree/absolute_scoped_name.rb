module WebIDL
  module ParseTree
    class AbsoluteScopedName < Treetop::Runtime::SyntaxNode

      def build
        raise NotImplementedError
      end

    end # RelativeScopedName
  end # ParseTree
end # WebIDL