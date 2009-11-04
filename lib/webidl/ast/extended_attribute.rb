module WebIDL
  module Ast
    class ExtendedAttribute

      attr_reader :name, :args

      def initialize(name, args = [])
        @name = name
        @args = args
      end

    end
  end # Ast
end # WebIDL