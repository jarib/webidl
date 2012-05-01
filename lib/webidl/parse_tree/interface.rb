module WebIDL
  module ParseTree
    class Interface < Treetop::Runtime::SyntaxNode

      def build(parent)
        intf = Ast::Interface.new(parent, name.text_value)

        unless members.empty?
          members.build(intf)
        end

        add_inheritance(parent, intf)

        intf
      end

      def add_inheritance(parent, intf)
        if inherits.any?
          intf.inherits = inherits.build(parent)
        end
      end

    end # Interface
  end # ParseTree
end # WebIDL