module WebIDL
  module ParseTree
    class Attribute < Treetop::Runtime::SyntaxNode

      def build(parent)
        options = {
          :readonly  => readonly.any?,
          :getraises => (getraises.build unless getraises.empty?),
          :setraises => (setraises.build unless setraises.empty?)
        }

        Ast::Attribute.new parent, type.build(parent), name.build, options
      end

    end # Attribute
  end # ParseTree
end # WebIDL