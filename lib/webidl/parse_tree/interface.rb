module WebIDL
  module ParseTree
    class Interface < Treetop::Runtime::SyntaxNode

      def build(parent)
        intf = Ast::Interface.new(parent, name.text_value)

        unless members.empty?
          members.build(intf)
        end

        unless inherits.empty?
          intf.inherits = inherits.build(parent)
        end

        intf
      end

    end # Interface

    class PartialInterface < Interface
      def partial?
        true
      end
    end
  end # ParseTree
end # WebIDL