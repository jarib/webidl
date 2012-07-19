module WebIDL
  module ParseTree
    class Callback < Treetop::Runtime::SyntaxNode

      def build(parent)
        Ast::Callback.new(
          name.text_value, 
          return_type.build(parent), 
          args.empty? ? [] : args.build(parent)
        )
      end

    end # Operation
  end # ParseTree
end # WebIDL
