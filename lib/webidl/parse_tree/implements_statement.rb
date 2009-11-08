module WebIDL
  module ParseTree
    class ImplementsStatement < Treetop::Runtime::SyntaxNode

      def build(parent)
        # not sure how this should be handled
        # currently keep a global list of interfaces, find the implementor and put the implementee in its 'implements' list
        # perhaps this is too early to do the resolving?
        implor_name = implementor.build(parent).qualified_name
        implee_name = implementee.build(parent).qualified_name

        implor = Ast::Interface.list[implor_name] || raise("Unknown interface #{implor_name.inspect}")
        implee = Ast::Interface.list[implee_name] || raise("Unknown interface #{implee_name.inspect}")

        implor.implements << implee

        nil
      end

    end # ImplementsStatement
  end # ParseTree
end # WebIDL