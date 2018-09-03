module WebIDL
  module ParseTree
    class IncludesStatement < Treetop::Runtime::SyntaxNode

      def build(parent)
        includer_name = includer.build(parent).qualified_name
        includee_name = includee.build(parent).qualified_name

        Ast::IncludesStatement.new(parent, includer_name, includee_name)
      end

    end # IncludesStatement
  end # ParseTree
end # WebIDL
