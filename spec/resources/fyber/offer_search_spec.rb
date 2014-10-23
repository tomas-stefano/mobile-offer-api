require 'rails_helper'

RSpec.describe Fyber::OfferSearch do
  describe '#fetch' do
    let(:timestamp) { '1414053767' }

    before do
      allow_any_instance_of(described_class).to receive(:timestamp).and_return(timestamp)
    end

    it 'find offers passing all parameters' do
      expect(Fyber::Offer).to receive(:where).with({
        uid:        '1',
        appid:      157,
        device_id:  '2b6f0cc904d137be2e1730235f5664094b831186',
        locale:     :de,
        ip:         '109.235.143.113',
        offer_types: 112,
        timestamp:   '1414053767',
        hashkey:     '95da071b59866350db01f102548a1b3729b5b912'
      })

      described_class.new({ uid: '1'}).fetch
    end
  end
end