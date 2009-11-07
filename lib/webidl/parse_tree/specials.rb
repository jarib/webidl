module WebIDL
  module ParseTree
    class Specials < Treetop::Runtime::SyntaxNode

      def build
        result = []

        result << first.text_value
        result += rest.build unless rest.empty?

        result
      end


    end # Specials
  end # ParseTree
end # WebIDL