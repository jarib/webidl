module WebIDL
  module ParseTree
    class SequenceType < Treetop::Runtime::SyntaxNode

      def build(parent)
        Ast::Sequence.new(nil, type.build(parent), :nullable => null.any?)
      end

    end # SequenceType
  end # ParseTree
end # WebIDL
