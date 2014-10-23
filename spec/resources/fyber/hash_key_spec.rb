require 'rails_helper'

RSpec.describe Fyber::HashKey do
  subject(:hash_key) do
    described_class.new(params)
  end

  describe '#generate' do
    let(:params) do
      {
        device_id: '2b6f0cc904d137be2e1730235f5664094b831186',
        ip:        '212.45.111.17',
        uid:       'player1',
        locale:    'de',
        appid:     157,
        page:      '2',
        ps_time:   '1312211903',
        pub0:      'campaign2',
        timestamp: '1312553361'
      }
    end

    it 'uses SHA1 algorithm after sort params by key' do
      expect(hash_key.generate).to eq('c223349e33a196c9cc6be6fa39921869b20f5ee4')
    end
  end
end