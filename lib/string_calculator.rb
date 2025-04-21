class StringCalculator
  class << self
    def add(numbers)
      return 0 if numbers.empty?

      delimiter, numbers = extract_delimiter_and_numbers(numbers)
      numbers.split(/#{delimiter}/).map(&:to_i).sum
    end

    def extract_delimiter_and_numbers(numbers)
      default_delimiter = /,|\\n/

      if numbers.start_with?('//')
        parts = numbers.split("\n", 2)
        delimiter_definition = parts[0] 
        numbers = parts[1]
        custom_delimiter = Regexp.escape(delimiter_definition[2..])
        return [custom_delimiter, numbers]
      end

      [default_delimiter, numbers]
    end
  end
end

# console application
if __FILE__ == $0
  puts 'Enter numbers with delimiter : '
  input = gets.chomp
  begin
    result = StringCalculator.add(input)
    puts "Result: #{result}"
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end
