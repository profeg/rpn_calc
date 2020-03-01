module Rpn
  # Simple Item
  # Can determine itself as variable or operator
  class Item
    def initialize(character)
      @character = character
    end

    def variable?
      /[[:digit:]]/.match? @character
    end

    def operand?
      /[+*\/-]/.match? @character
    end

    def division?
      value == '/'
    end

    def value
      if variable?
        eval(@character)
      elsif operand?
        @character
      end
    rescue SyntaxError
      raise StandardError, "Unrecognized symbol in #{@character}"
    end
  end
end
