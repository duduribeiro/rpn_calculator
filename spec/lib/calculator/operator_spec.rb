require 'spec_helper'

module Calculator
  describe Operator do
    describe '.exists?' do
      subject { described_class.exists?(operator) }
      context 'with a valid operator' do
        let(:operator) { '+' }

        it { is_expected.to be_truthy }
      end

      context 'with an invalid operator' do
        let(:operator) { '$' }

        it { is_expected.to be_falsey }
      end
    end
  end
end
