require 'rails_helper'

RSpec.describe Fyber::Offer do
  let(:attributes) { {} }
  subject(:offer) { described_class.new(attributes) }

  describe '.resource_name' do
    it 'returns offers.json' do
      expect(described_class.resource_name).to eq('offers.json')
    end
  end

  describe '.collection_root_name' do
    it 'returns offers name' do
      expect(described_class.collection_root_name).to eq('offers')
    end
  end

  describe '#thumbnail_low_resolution' do
    context 'when has thumbnail' do
      let(:attributes) do
        {
          'thumbnail' => {
            'lowres' => 'http://pay.com/1808/2_square_60.png',
            'hires'  => 'http://pay.com/1808/2_square_175.png'
          }
        }
      end

      it 'returns the thumbnail in low resolution' do
        expect(offer.thumbnail_low_resolution).to eq('http://pay.com/1808/2_square_60.png')
      end
    end

    context 'when thumbnail is empty' do
      let(:attributes) do
        {
          thumbnail: {}
        }
      end

      it 'returns an empty string' do
        expect(offer.thumbnail_low_resolution).to eq('')
      end
    end

    context 'when thumbnail is nil' do
      let(:attributes) do
        {
          'thumbnail' => nil
        }
      end

      it 'returns an empty string' do
        expect(offer.thumbnail_low_resolution).to eq('')
      end
    end
  end

  describe '#to_partial_path' do
    it 'returns the plural and singular of the class' do
      expect(offer.to_partial_path).to eq('offers/offer')
    end
  end
end