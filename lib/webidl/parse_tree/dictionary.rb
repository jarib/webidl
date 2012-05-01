module WebIDL
  module ParseTree
    class Dictionary < Treetop::Runtime::SyntaxNode

      def build(parent)
        dict = Ast::Dictionary.new(parent, name.text_value)

        if members.any?
          members.build(dict)
        end

        add_inheritance(dict)

        dict
      end

      def add_inheritance(dict)
        if inherits.any?
          dict.inherits = inherits.build(dict)
        end
      end

    end # Dictionary
  end # ParseTree
end # WebIDL