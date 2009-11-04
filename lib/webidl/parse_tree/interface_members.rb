module WebIDL
  module ParseTree
    class InterfaceMembers < Treetop::Runtime::SyntaxNode

      def build
        m = member.build
        m.extended_attributes = eal.build unless eal.empty?

        list = [m]
        list += members.build unless members.empty?

        list
      end

    end # InterfaceMembers
  end # ParseTree
end # WebIDL