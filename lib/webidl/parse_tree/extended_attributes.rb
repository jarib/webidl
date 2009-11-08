module WebIDL
  module ParseTree

    class ExtendedAttributeList < Treetop::Runtime::SyntaxNode
      def build
        list = [attribute.build(parent)]
        list += attributes.build(parent) unless attributes.empty?

        list
      end
    end

    class ExtendedAttributeArgList < Treetop::Runtime::SyntaxNode
      def build(parent)
        Ast::ExtendedAttribute.new(name.text_value, args.build(parent))
      end
    end

    class ExtendedAttributeIdent < Treetop::Runtime::SyntaxNode
      def build(parent)
        [key, value].map { |e| e.text_value }
      end
    end

    class ExtendedAttributeNamedArgList < Treetop::Runtime::SyntaxNode
      def build(parent)
        [key.text_value, value.build(parent)]
      end
    end

    class ExtendedAttributeScopedName < Treetop::Runtime::SyntaxNode
      def build(parent)
        [key.text_value, scoped_name.build(parent)]
      end
    end

  end # ParseTree
end # WebIDL
