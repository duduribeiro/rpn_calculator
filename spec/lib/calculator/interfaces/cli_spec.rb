require 'spec_helper'

module Calculator
  RSpec.describe Interfaces::CLI do
    let(:engine) { double(:engine, process_input: nil) }
    let(:cli)    { described_class.new(engine: engine) }

    describe '#start' do
      it 'reads the input' do
        allow($stdin).to receive(:gets).and_return('1', '2', '+', nil)

        cli.start
      end
    end
  end
end
