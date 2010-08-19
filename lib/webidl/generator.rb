module WebIDL
  class Generator

    class ParseError < StandardError; end

    def initialize(visitor = nil)
      @visitor = visitor
    end

    def generate(input)
      ast_defs = case input
                 when String
                   parse(input)
                 when Array
                   input.each do |e|
                     unless e.kind_of? WebIDL::Ast::Node
                       raise TypeError, "input Array elements must be of WebIDL::Ast::Node (got #{e.class})"
                     end
                   end

                   input
                 when WebIDL::Ast::Node
                   [input]
                 else
                   raise TypeError, "unexpected input #{input.class}"
                 end

      strings = ast_defs.map { |definition| ruby2ruby.process definition.accept(visitor) }.compact
      strings.join("\n\n")
    end

    private

    def parse(str)
      parse_tree = parser.parse(str)

      if parse_tree.nil?
        raise ParseError, parser.failure_reason
      end

      parse_tree.build
    end

    def ruby2ruby
      @ruby2ruby ||= Ruby2Ruby.new
    end

    def parser
      @parser ||= WebIDL::Parser::IDLParser.new
    end

    def visitor
      @visitor ||= RubySexpVisitor.new
    end

  end # Generator
end # WebIDL