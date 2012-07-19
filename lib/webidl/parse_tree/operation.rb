module WebIDL
  module ParseTree
    class Operation < Treetop::Runtime::SyntaxNode

      def build(parent)
        if respond_to?(:specials)
          special_list = specials.build unless specials.empty?
          operation    = op
        else
          special_list = []
          operation    = self
        end

        typ        = operation.type.build(parent)
        name       = operation.optional_id.text_value unless operation.optional_id.empty?
        arguments  = operation.args.build(parent) unless operation.args.empty?
        raise_list = operation.raises.build unless operation.raises.empty?

        Ast::Operation.new(
          parent, typ,  :name     => name,
                        :specials => special_list,
                        :args     => arguments,
                        :raises   => raise_list,
                        :static   => respond_to?(:static)
        )
      end

    end # Operation
  end # ParseTree
end # WebIDL