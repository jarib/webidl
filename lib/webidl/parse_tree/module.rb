module WebIDL
  module ParseTree
    class Module < Treetop::Runtime::SyntaxNode

      def build
        Ast::Module.new(name.text_value, defs.build)
      end

    end # Module
  end # ParseTree
end # WebIDL