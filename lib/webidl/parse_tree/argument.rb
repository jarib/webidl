module WebIDL
  module ParseTree
    class Argument < Treetop::Runtime::SyntaxNode

      def build(parent)
        xattrs = eal.build(parent) unless eal.empty?

        arg = Ast::Argument.new(
          id.build,
          type.build(parent),
          :optional            => optional.any?,
          :variadic            => variadic.any?,
          :extended_attributes => xattrs
        )

        arg
      end

    end # Argument
  end # ParseTree
end # WebIDL