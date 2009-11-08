module WebIDL
  module ParseTree
    class InterfaceInheritance < Treetop::Runtime::SyntaxNode

      def build(parent)
        names.build(parent)
      end

    end # InterfaceInheritance
  end # ParseTree
end # WebIDL