require 'spec_helper'

module Calculator
  RSpec.describe Interfaces::CustomOperations::CLI::Quit do
    describe '.execute' do
      subject { described_class.execute }

      it 'exits the flow' do
        expect { subject }.to raise_error SystemExit
      end
    end
  end
end
