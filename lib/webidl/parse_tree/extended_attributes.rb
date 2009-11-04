module WebIDL
  module ParseTree

    class ExtendedAttributeList < Treetop::Runtime::SyntaxNode
      def build
        list = [attribute.build]
        list += attributes.build unless attributes.empty?

        list
      end
    end

    class ExtendedAttributeArgList < Treetop::Runtime::SyntaxNode
      def build
        Ast::ExtendedAttribute.new(name.text_value, args.build)
      end
    end

    class ExtendedAttributeIdent < Treetop::Runtime::SyntaxNode
      def build
        raise NotImplementedError
      end
    end

    class ExtendedAttributeNamedArgList < Treetop::Runtime::SyntaxNode
      def build
        raise NotImplementedError
      end
    end

  end # ParseTree
end # WebIDL
