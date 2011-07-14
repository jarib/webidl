module WebIDL
  module ParseTree
    class Type < Treetop::Runtime::SyntaxNode

      def build(parent)
        result = type.build(parent)

        if result.kind_of? Ast::ScopedName
          result = Ast::Type.new parent, result.name # or qualified_name?
        end

        if suffix.any?
          suffix.apply(result)
        end

        result
      end

    end # Type
  end # ParseTree
end # WebIDL
