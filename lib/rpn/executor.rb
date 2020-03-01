module Rpn
  # Execute input string
  class Executor
    attr_reader :result

    def initialize(input, stack)
      @input = input
      @result = stack
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
      @result.push item.value
    end

    def execute(item)
      raise StandardError, 'Two variables need for this operation' if @result.size < 2

      x, y = @result.pop(2)
      result =
        if item.division?
          divide(x, y)
        else
          eval("#{x} #{item.value} #{y}")
        end

      @result.push result
    end

    def divide(x, y)
      result = x.fdiv(y)

      raise StandardError, 'Can\'t divide to zero' unless result.finite?

      if x.is_a?(Integer) && y.is_a?(Integer) && result.modulo(1) == 0.0
        result = result.floor
      end
      result
    end
  end
end
