module WebIDL
  module ParseTree
    class InterfaceMembers < Treetop::Runtime::SyntaxNode

      def build(parent)
        debugger unless member.respond_to?(:build)
        m = member.build(parent)
        m.extended_attributes = eal.build(parent) unless eal.empty?

        list = [m]
        list += members.build(parent) unless members.empty?

        if parent
          parent.members = list
        end

        list
      end

    end # InterfaceMembers
  end # ParseTree
end # WebIDL