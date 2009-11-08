module WebIDL
  module ParseTree
    class ScopedNameList < Treetop::Runtime::SyntaxNode

      def build(parent)
        result = []

        result << name.build(parent)
        result += names.build(parent) unless names.empty?

        result
      end

    end # ScopedNameList
  end # ParseTree
end # WebIDL