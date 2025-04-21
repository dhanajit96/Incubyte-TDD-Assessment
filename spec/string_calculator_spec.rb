require 'spec_helper'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'If input is Empty string' do
      it 'Sum will returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end
  end
end
