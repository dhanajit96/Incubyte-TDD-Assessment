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
      end
    end

    context 'input is two digits number separted by delimiter (comma to \n)' do
      it 'returns Sum of two number is provided' do
        expect(StringCalculator.add('5,5')).to eq(10)
        expect(StringCalculator.add('5\n15')).to eq(20)
      end
    end
  end
end
