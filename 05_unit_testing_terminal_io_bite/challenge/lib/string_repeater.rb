# Test drive a class that behaves like this:


class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end
  
  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    string = get_string
    @terminal.puts "Please enter a number of repeats"
    repeats = get_string.to_i
    @terminal.puts "Here is your result:"
    @terminal.puts "#{string * repeats}"
  end

  private

  def get_string
    return string = @terminal.gets.chomp
  end
end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX