module WebIDL
  module Ast
    class ScopedName

      def initialize(name, opts = {})
        @name = name
        @relative = !!opts[:relative]
      end

      def relative?
        @relative
      end

    end # ScopedName
  end # Ast
end # WebIDL