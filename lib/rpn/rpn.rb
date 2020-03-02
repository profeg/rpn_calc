module Rpn
  # Consciously selected class variable as a global stack holder
  @@stack = []
  
  def self.run
    loop do
      print '> '
      input = gets&.chomp

      # check input for correct symbols
      break if input.nil? || input == 'q'
      check_input(input)

      # try to execute input
      rpn = Rpn::Executor.new(input, @@stack.dup)

      # update global stack if correct
      @@stack = rpn.new_stack if @@stack != rpn.new_stack

      # print stack
      puts @@stack.to_s
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end

  def self.check_input(input)
    return unless (unrecognized_character = %r{[^+\/*\d\s\-\.]}.match(input))
    raise ArgumentError, "Unrecognized character: #{unrecognized_character}"
  end
end
