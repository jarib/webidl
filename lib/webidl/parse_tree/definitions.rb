module WebIDL
  module ParseTree
    class Definitions < Treetop::Runtime::SyntaxNode

      def build(parent = nil)
        return [] if metadef.empty?

        if metadef.d.any?
          definition = metadef.d.build(parent)
          definition.extended_attributes = metadef.eal.build(parent) unless metadef.eal.empty?
        end

        result = [definition]
        result += metadef.defs.build(parent) unless metadef.defs.empty?

        if parent
          parent.definitions = result
        end

        result.compact
      end

    end # Definitions
  end # ParseTree
end # WebIDL