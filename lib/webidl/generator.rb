require "webidl/generator/ruby_sexp_visitor"
module WebIDL
  class Generator

    class ParseError < StandardError; end

    def initialize(visitor = nil)
      @visitor = visitor
    end

    def generate(str)
      parse_tree = parser.parse(str)

      if parse_tree.nil?
        raise ParseError, parser.failure_reason
      end

      ast_defs = parse_tree.build
      strings = ast_defs.map { |definition| ruby2ruby.process definition.accept(visitor) }
      strings.join("\n\n")
    end

    private

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