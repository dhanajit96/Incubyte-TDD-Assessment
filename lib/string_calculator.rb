class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # below are default delimiter
    delimiter = /,|\\n/

    numbers.split(delimiter).map(&:to_i).sum
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
