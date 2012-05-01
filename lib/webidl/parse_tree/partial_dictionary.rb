module WebIDL
  module ParseTree
    class PartialDictionary < Dictionary

      def build(parent)
        intf = super
        intf.partial = true

        intf
      end

      def add_inheritance(intf)
        # partial dictionaries does not support inheritance
      end

      def partial?
        true
      end

    end
  end
end