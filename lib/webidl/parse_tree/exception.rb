module WebIDL
  module ParseTree
    class Exception < Treetop::Runtime::SyntaxNode

      def build(parent)
        ex = Ast::Exception.new(parent, name.text_value)

        unless inherits.empty?
          ex.inherits = inherits.build(parent)
        end

        members.build(ex) unless members.empty?

        ex
      end

    end # Exception
  end # ParseTree
end # WebIDL