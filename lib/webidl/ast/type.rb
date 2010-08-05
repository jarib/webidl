module WebIDL
  module Ast
    class Type < Node

      attr_reader :name

      def initialize(parent, name, opts = {})
        super(parent)

        @name     = camel_case_type(name.strip).to_sym
        @nullable = !!opts[:nullable]
      end

      def nullable?
        @nullable
      end

      def array!
        @name = "#{@name}Array".to_sym
      end

      private

      def camel_case_type(name)
        name.split(/[_ ]/).map { |e| e[0] = e[0].upcase; e }.join
      end

    end # Type
  end # Ast
end # WebIDL
