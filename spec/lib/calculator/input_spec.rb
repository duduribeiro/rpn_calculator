require 'spec_helper'

module Calculator
  RSpec.describe Input do
    describe '#value?' do
      subject { described_class.new(input).value? }

      context 'with a number' do
        let(:input) { '123' }

        it { is_expected.to be_truthy }
      end

      context 'with a non numeric character' do
        let(:input) { '+' }

        it { is_expected.to be_falsey }
      end
    end

    describe '#value' do
      subject { described_class.new('123').value }

      it { is_expected.to eq(123) }
    end
  end
end
