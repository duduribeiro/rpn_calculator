require 'spec_helper'

module Calculator
  RSpec.describe Interfaces::CLI do
    let(:engine) { double(:engine, process_input: nil) }
    let(:cli)    { described_class.new(engine: engine) }

    describe '#start' do
      subject { cli.start(nil) }

      it 'reads the input' do
        allow($stdin).to receive(:gets).and_return('1', '2', '+', nil)

        subject
      end

      context 'with invalid calculation' do
        before(:each) do
          allow(engine).to receive(:process_input).and_raise(Errors::InvalidCalculation, 'Error')
          allow($stdin).to receive(:gets).and_return('1', nil)
        end

        it 'displays that it is an invalid calculation' do
          expect { subject }.to output(['Starting calculator.', '💥 invalid calculation. Error', nil].join("\n")).to_stdout
        end

        it 'does not exit the flow' do
          expect { subject }.not_to raise_error SystemExit
        end
      end

      context 'with invalid calculation' do
        before(:each) do
          allow(engine).to receive(:process_input).and_raise(Errors::InvalidOperator)
          allow($stdin).to receive(:gets).and_return('1', nil)
        end

        it 'displays that it is an invalid operator' do
          expect { subject }.to output(['Starting calculator.', "> This isn't a valid operator 😔", nil].join("\n")).to_stdout
        end

        it 'does not exit the flow' do
          expect { subject }.not_to raise_error SystemExit
        end
      end
    end
  end
end
