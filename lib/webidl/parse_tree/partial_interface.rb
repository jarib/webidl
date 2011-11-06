module WebIDL
  module ParseTree
    class PartialInterface < Interface

      def build(parent)
        intf = super
        intf.partial = true

        intf
      end

    end
  end
end