require 'spec_helper'

module Calculator
  RSpec.describe Calculator::Runner do
    describe '.start' do
      context 'engines' do
        context 'specifying rpn' do
          it 'sets engine to RPN' do
            runner = Calculator::Runner.new(['-e', 'rpn'])

            expect(Engine).to receive(:load_engine).with(:rpn)

            runner.execute
          end
        end
      end

      context 'interfaces' do
        context 'when it is not informed' do
          it 'sets interface to the default one (cli)' do
            runner = Calculator::Runner.new(['-e', 'rpn'])

            expect(Interface).to receive(:load_interface).with(:cli)

            runner.execute
          end
        end
      end
    end
  end
end
