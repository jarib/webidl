module WebIDL
  module ParseTree
    class Inheritance < Treetop::Runtime::SyntaxNode

      def build(parent)
        names.build(parent)
      end

    end # Inheritance
  end # ParseTree
end # WebIDL