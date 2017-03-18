require 'spec_helper'

RSpec.describe 'CLI RPN calculator' do
  describe '2 numbers and 1 operation' do
    let(:runner) { Calculator::Runner.new(['-e', 'rpn', '-i', 'cli']) }
    subject { runner.execute }

    it 'returns the correct value' do
      allow($stdin).to receive(:gets).and_return('5', '8', '+', nil)

      # expect($stdout).to receive(:puts).with("Star")
      expect { subject }.to output(['Starting calculator.', '5', '8', '+', '13', nil].join("\n")).to_stdout

      subject
    end
  end
end
