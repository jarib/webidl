module DebugHelper
  def terminal_parse_failure(*args)
    p :terminal_parse_failure => args
    super
  end

  def instantiate_node(node, input, interval, *args)
    p :instantiating_from => caller.first[/in `(.+)'/, 1], :str => input[interval]
    super
  end
end