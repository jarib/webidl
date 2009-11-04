module WebIDL
  module ParseTree
    class ArgumentList < Treetop::Runtime::SyntaxNode

      def build
        list = [arg.build]
        list += args.build unless args.empty?

        list
      end

    end # ArgumentList
  end # ParseTree
end # WebIDL