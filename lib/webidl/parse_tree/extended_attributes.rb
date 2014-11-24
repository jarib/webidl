module WebIDL
  module ParseTree

    class ExtendedAttributeList < Treetop::Runtime::SyntaxNode
      def build(parent)
        list = [attribute.build(parent)]
        list += attributes.build(parent) unless attributes.empty?

        list
      end
    end

    class ExtendedAttributeArgList < Treetop::Runtime::SyntaxNode
      def build(parent)
        unless args.empty?
          arguments = args.build(parent)
        end
        Ast::ExtendedAttribute.new(name.text_value, arguments)
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

    class ExtendedAttributeIdentList < Treetop::Runtime::SyntaxNode
      def build(parent)
        [key.text_value, list.text_value.split(",").map(&:strip)]
      end
    end

  end # ParseTree
end # WebIDL
