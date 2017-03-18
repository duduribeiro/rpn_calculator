require 'spec_helper'

module Calculator
  RSpec.describe Calculator::Runner do
    describe '.start' do
      context 'specifying a rpn engine' do
        it 'sets engine to RPN' do
          runner = Calculator::Runner.new(['-e', 'rpn'])

          expect(Engine).to receive(:load_engine).with(:rpn)

          runner.execute
        end
      end
    end
  end
end
