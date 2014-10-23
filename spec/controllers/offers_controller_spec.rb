require 'rails_helper'

RSpec.describe OffersController do
  describe 'GET /' do
    context 'when request root path' do
      before do
        allow_any_instance_of(OffersForm).to receive(:has_user_data_and_valid?).and_return(false)

        get :index
      end

      it 'responds ok' do
        expect(response.status).to be 200
      end

      it 'do not assigns offers' do
        expect(assigns[:offers]).to be nil
      end
    end

    context 'when search for offers' do
      let(:offers) { double(response: api_response) }

      before do
        expect_any_instance_of(Fyber::OfferSearch).to receive(:fetch).and_return(offers)
        get :index, offers_form: { uid: '200' }
      end

      context 'when API responds success' do
        let(:api_response) { double(status: 200) }

        it 'responds successful' do
          expect(response.status).to be(200)
        end
      end

      context 'when API responds to a bad request' do
        let(:api_response) { double(status: 400) }

        it 'responds bad request' do
          expect(response.status).to be(400)
        end
      end
    end
  end
end