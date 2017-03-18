require 'spec_helper'

module Calculator
  RSpec.describe Calculator::Runner do
    before(:each) { allow($stdin).to receive(:gets).and_return(nil) }

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
        let(:interface_double) { double(:interface) }

        context 'when it is not informed' do
          it 'sets interface to the default one (cli)' do
            runner = Calculator::Runner.new(['-e', 'rpn'])

            expect(Interface).to receive(:load_interface).with(:cli).and_call_original

            runner.execute
          end
        end

        context 'specifying a file interface' do
          it 'sets interface to file' do
            runner = Calculator::Runner.new(['-e', 'rpn', '-i', 'file'])

            expect(Interface).to receive(:load_interface).with(:file).and_call_original

            runner.execute
          end
        end
      end

      context 'help menu' do
        it 'exits the flow' do
          runner = Calculator::Runner.new(['-h'])

          expect { runner.execute }.to raise_error SystemExit
        end
      end
    end
  end
end
