module WebIDL
  module Ast
    class Type < Node

      def initialize(parent, name, opts = {})
        super(parent)

        @name     = camel_case_type(name.strip).to_sym
        @nullable = !!opts[:nullable]
        @array = !!opts[:array]
      end

      def nullable?
        @nullable
      end

      def array?
        @array
      end

      def array=(bool)
        @array = bool
      end

      def nullable=(bool)
        @nullable = bool
      end

      def name
        (array? ? "#{@name}Array" : @name).to_sym
      end

      private

      def camel_case_type(name)
        name.split(/[_ ]/).map { |e| e[0,1] = e[0,1].upcase; e }.join
      end

    end # Type
  end # Ast
end # WebIDL
