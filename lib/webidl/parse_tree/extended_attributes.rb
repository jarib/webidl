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
        [key, value].map { |e| e.text_value }
      end
    end

    class ExtendedAttributeNamedArgList < Treetop::Runtime::SyntaxNode
      def build
        [key.text_value, value.build]
      end
    end

    class ExtendedAttributeScopedName < Treetop::Runtime::SyntaxNode
      def build
        [key.text_value, scoped_name.build]
      end
    end

  end # ParseTree
end # WebIDL
