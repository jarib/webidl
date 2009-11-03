module WebIDL
  module ParseTree
    class Definitions < Treetop::Runtime::SyntaxNode

      def build
        extended_attributes = metadef.eal.build unless metadef.eal.empty?
        definitions = []

        definitions << metadef.d unless metadef.d.empty?
        definitions << metadef.defs unless metadef.defs.empty?

        Ast::Definitions.new(extended_attributes, definitions.map { |d| d.build })
      end

    end # Definitions
  end # ParseTree
end # WebIDL