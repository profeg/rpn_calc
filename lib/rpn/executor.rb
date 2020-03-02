module Rpn
  # Execute input string
  class Executor
    attr_reader :new_stack

    def initialize(input, stack)
      @input = input
      @new_stack = stack
      @input.split(' ').each { |i| consume(i) }
    end

    def consume(item)
      rpn_item = ::Rpn::Item.new(item)
      if rpn_item.variable?
        push(rpn_item)
      elsif rpn_item.operand?
        execute(rpn_item)
      end
    end

    def push(item)
      @new_stack.push item.value
    end

    def execute(item)
      raise StandardError, 'Two variables need for this operation' if @new_stack.size < 2

      x, y = @new_stack.pop(2)
      result =
        if item.division?
          divide(x, y)
        else
          x.public_send(item.value, y)
        end

      @new_stack.push result
    end

    def divide(x, y)
      div_result = x.fdiv(y)

      raise StandardError, 'Can\'t divide to zero' unless div_result.finite?

      div_result
    end
  end
end
