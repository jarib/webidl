module WebIDL
  module ParseTree
    class RelativeScopedName < Treetop::Runtime::SyntaxNode

      def build
        n = ''
        n << name.text_value
        n << parts.text_value

        sn = Ast::ScopedName.new(n, :relative => true)
      end

    end # RelativeScopedName
  end # ParseTree
end # WebIDL