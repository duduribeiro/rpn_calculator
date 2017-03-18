require 'spec_helper'

RSpec.describe 'CLI RPN calculator' do
  let(:runner) { Calculator::Runner.new(['-e', 'rpn', '-i', 'cli']) }

  describe '2 numbers and a sum' do
    subject { runner.execute }

    it 'returns the correct value' do
      allow($stdin).to receive(:gets).and_return('5', '8', '+', nil)

      expect { subject }.to output(['Starting calculator.', '> 5', '> 8', '> +', '> 13', nil].join("\n")).to_stdout
    end
  end

  describe '2 negatives values, an product, another value and a sum' do
    subject { runner.execute }

    it 'returns the correct value' do
      allow($stdin).to receive(:gets).and_return('-3', '-2', '*', '5', '+', nil)

      expect { subject }.to output(['Starting calculator.', '> -3', '> -2', '> *', '> 6', '> 5', '> +', '> 11', nil].join("\n")).to_stdout
    end
  end

  describe '3 numbers, a subtraction and a division' do
    subject { runner.execute }

    it 'returns the correct value' do
      allow($stdin).to receive(:gets).and_return('5', '9', '1', '-', '/', nil)

      expect { subject }.to output(['Starting calculator.', '> 5', '> 9', '> 1', '> -', '> 8', '> /', '> 0.625', nil].join("\n")).to_stdout
    end
  end
end
