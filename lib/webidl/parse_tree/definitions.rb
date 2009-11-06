module WebIDL
  module ParseTree
    class Definitions < Treetop::Runtime::SyntaxNode

      def build
        return [] if metadef.empty?

        unless metadef.d.empty?
          definition = metadef.d.build
          definition.extended_attributes = metadef.eal.build unless metadef.eal.empty?
        end

        result = [definition]
        result << metadef.defs.build.map { |e| e.build } unless metadef.defs.empty?

        result
      end

    end # Definitions
  end # ParseTree
end # WebIDL