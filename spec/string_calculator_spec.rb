require 'spec_helper'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'If input is Empty string' do
      it 'Sum will returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'If input is single number string' do
      it 'Sum will returns same number' do
        expect(StringCalculator.add('5')).to eq(5)
        expect(StringCalculator.add('25')).to eq(25)
      end
    end

    context 'input is two digits number separted by default delimiter (comma to \n)' do
      it 'returns Sum of two number is provided' do
        expect(StringCalculator.add('5,5')).to eq(10)
        expect(StringCalculator.add('5\n15')).to eq(20)
      end
    end

    context 'when custom delimiter is provided' do
      it 'returns sum using ; as delimiter' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it 'returns sum using | as delimiter' do
        expect(StringCalculator.add("//|\n4|5|6")).to eq(15)
      end

      it 'returns sum using # as delimiter' do
        expect(StringCalculator.add("//#\n10#20#30")).to eq(60)
      end

      it 'returns sum using a special character like * as delimiter' do
        expect(StringCalculator.add("//*\n2*3*4")).to eq(9)
      end

      it 'returns 0 for empty string after custom delimiter' do
        expect(StringCalculator.add("//;\n")).to eq(0)
      end

      it 'returns 0 for empty string after custom delimiter' do
        expect(StringCalculator.add("//***\n1***2***3")).to eq(6)
      end
    end
  end

  describe '.extract_delimiter_and_numbers' do
    it 'extracts custom delimiter and number string' do
      result = StringCalculator.send(:extract_delimiter_and_numbers, "//;\n1;2")
      expect(result).to eq([';', '1;2'])
    end

    it 'returns default delimiters and numbers if no custom delimiter' do
      result = StringCalculator.send(:extract_delimiter_and_numbers, "1,2\n3")
      expect(result).to eq([/,|\\n/, "1,2\n3"])
    end
  end
end
