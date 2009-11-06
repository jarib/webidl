module WebIDL
  module ParseTree
    class Exception < Treetop::Runtime::SyntaxNode

      def build
        n = name.text_value
        m = members.build unless members.empty?

        Ast::Exception.new(n, m)
      end

    end # Exception
  end # ParseTree
end # WebIDL