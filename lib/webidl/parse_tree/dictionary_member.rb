module WebIDL
  module ParseTree
    class DictionaryMember < Treetop::Runtime::SyntaxNode

      def build(parent)
        raise unless default.empty? or default.respond_to?(:build)

        dm = Ast::DictionaryMember.new parent,
                                       type.build(parent),
                                       name.build,
                                       (default.build unless default.empty?)
      end

    end # Attribute
  end # ParseTree
end # WebIDL
