module WebIDL
  module ParseTree
    class Operation < Treetop::Runtime::SyntaxNode

      def build(parent)
        special_list  = specials.build unless specials.empty?
        type          = op.type.build(parent)
        name          = op.optional_id.text_value unless op.optional_id.empty?
        args          = op.args.build(parent) unless op.args.empty?
        raises        = op.raises.build unless op.raises.empty?

        Ast::Operation.new(
          parent, type, :name     => name,
                        :specials => special_list,
                        :args     => args,
                        :raises   => raises
        )
      end

    end # Operation
  end # ParseTree
end # WebIDL