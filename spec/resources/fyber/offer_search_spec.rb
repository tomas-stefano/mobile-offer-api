require 'rails_helper'

RSpec.describe Fyber::OfferSearch do
  subject(:offer_search) { described_class.new(params) }
  let(:params) { { uid: 'sample1' }}

  describe '#fetch' do
    let(:timestamp) { '1414053767' }

    before do
      allow_any_instance_of(described_class).to receive(:timestamp).and_return(timestamp)
    end

    it 'find offers passing all parameters' do
      expect(Fyber::Offer).to receive(:where).with({
        uid:        'sample1',
        appid:      157,
        device_id:  '2b6f0cc904d137be2e1730235f5664094b831186',
        locale:     :de,
        ip:         '109.235.143.113',
        offer_types: 112,
        timestamp:   '1414053767',
        hashkey:     'ad1cc3e284f81d247664213c34f6bdd211309447'
      })

      offer_search.fetch
    end
  end
end