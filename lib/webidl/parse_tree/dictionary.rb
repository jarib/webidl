module WebIDL
  module ParseTree
    class Dictionary < Treetop::Runtime::SyntaxNode

      def build(parent)
        dict = Ast::Dictionary.new(parent, name.text_value)

        unless members.empty?
          members.build(dict)
        end

        unless inherits.empty?
          dict.inherits = inherits.build(dict)
        end

        dict
      end

    end # Dictionary
  end # ParseTree
end # WebIDL