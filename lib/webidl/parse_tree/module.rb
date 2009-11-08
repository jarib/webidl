module WebIDL
  module ParseTree
    class Module < Treetop::Runtime::SyntaxNode

      def build(parent = nil)
        m = Ast::Module.new(parent, name.text_value)

        defs.build(m)

        m
      end

    end # Module
  end # ParseTree
end # WebIDL