module WebIDL
  module ParseTree
    class Argument < Treetop::Runtime::SyntaxNode

      def build(parent)
        arg = Ast::Argument.new(
          id.build,
          type.build(parent),
          :optional => optional.any?,
          :variadic => variadic.any?
        )

        arg.extended_attributes = eal.build unless eal.empty?

        arg
      end

    end # Argument
  end # ParseTree
end # WebIDL