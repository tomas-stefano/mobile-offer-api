require 'spec_helper'

RSpec.describe Fyber::ResponseSignature do
  subject(:response_signature) do
    described_class.new(response)
  end

  describe '#valid?' do
    context 'when is valid' do
      let(:response) do
        double(
          body: {
            "code"    => "NO_CONTENT",
            "message" => "Successful request, but no offers are currently available for this user.",
            "count"   => 0,
            "pages"   => 0,
            "information"=>{
              "app_name"         => "Demo iframe for publisher - do not touch",
              "appid"            => 157,
              "virtual_currency" => "Coins",
              "country"          => "DE",
              "language"         => "DE",
              "support_url"      => "http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=1"
            },
              "offers" => []
          },
          headers: {
            'x-sponsorpay-response-signature' => 'f11d4b3a744d47c3fb18a0ba73545e767e3b8d9b'
          }
        )
      end

      it 'returns true' do
        expect(response_signature).to be_valid
      end
    end

    context 'when is false' do
      let(:response) do
        double(
          body: {
            "code"    => "NO_CONTENT",
            "message" => "Successful request, but no offers are currently available for this user.",
          },
          headers: {
            'x-sponsorpay-response-signature' => 'c2d836cfe82f9bdf091176bb4e7b2bad13be44c0'
          }
        )
      end

      it 'returns false' do
        expect(response_signature).to_not be_valid
      end
    end
  end
end