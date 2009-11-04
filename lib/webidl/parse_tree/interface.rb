module WebIDL
  module ParseTree
    class Interface < Treetop::Runtime::SyntaxNode

      def build
        Ast::Interface.new(
          name.text_value,
          (members.build unless members.empty?),
          (inherits.name unless inherits.empty?)
        )
      end

    end # Interface
  end # ParseTree
end # WebIDL