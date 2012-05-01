module WebIDL
  module ParseTree
    class Argument < Treetop::Runtime::SyntaxNode

      def build(parent)
        xattrs = eal.build(parent) unless eal.empty?

        options = {:extended_attributes => xattrs}

        if arg.respond_to?(:optional) && arg.optional.any?
          options[:optional] = true
          options[:default] = arg.default.build if arg.default.any?
        else
          options[:variadic] = arg.variadic.any?
        end

        Ast::Argument.new(
          arg.name.build,
          arg.type.build(parent),
          options
        )
      end

    end # Argument
  end # ParseTree
end # WebIDL