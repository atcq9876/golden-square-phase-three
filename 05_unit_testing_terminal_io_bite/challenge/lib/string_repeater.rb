# Test drive a class that behaves like this:


class StringRepeater
  def initialize(terminal)
    @terminal = terminal
    @number_count = 0
  end
  
  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    string = get_string
    @terminal.puts "Please enter a number of repeats"
    repeats = get_string
    @terminal.puts "Here is your result:"
    @terminal.puts "#{string * repeats}"
  end

  private

  def get_string
    string = @terminal.gets.chomp
    @number_count += 1
    if @number_count == 1
      return string
    elsif @number_count == 2
      return string.to_i if string.to_i.to_s == string
      raise "'Repeats' must be a number"
    end
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