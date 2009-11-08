module WebIDL
  module ParseTree
    class ArgumentList < Treetop::Runtime::SyntaxNode

      def build(parent)
        list = [arg.build(parent)]
        list += args.build(parent) unless args.empty?

        list
      end

    end # ArgumentList
  end # ParseTree
end # WebIDL