module WebIDL
  module ParseTree
    class StringifierAttributeOrOperation < Treetop::Runtime::SyntaxNode

      def build(parent)
        unless a_or_op.empty? || a_or_op.text_value == ";"
          elem = a_or_op.build(parent)
          elem.stringifier = true

          elem
        end
      end

    end # StringifierAttributeOrOperation
  end # ParseTree
end # WebIDL