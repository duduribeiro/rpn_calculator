require 'spec_helper'

module Calculator
  RSpec.describe Engines::RPN do
    let(:engine) { described_class.new }

    describe '#process_input' do
      subject { engine.process_input(input) }

      context 'with a value input' do
        let(:input) { Input.new('123') }

        it 'sends the value to the stack' do
          expect(engine.instance_variable_get(:@stack)).to be_empty

          subject

          expect(engine.instance_variable_get(:@stack).first).to eq(123)
        end
      end

      context 'with a valid operator' do
        context 'and the stack is without the necessary size to calculate' do
          before { engine.process_input(Input.new('1')) }

          let(:input) { Input.new('+') }

          it 'raises an invalid calculation error' do
            expect { subject }.to raise_error(Errors::InvalidCalculation, "Not enough values to calculate")
          end
        end
      end

      context 'with an invalid operator' do
        let(:input) { Input.new('$') }

        it 'raises an invalid operator error' do
          expect { subject }.to raise_error(Errors::InvalidOperator)
        end
      end
    end
  end
end
