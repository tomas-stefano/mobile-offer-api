class OffersController < ApplicationController
  def index
    @offers_form = OffersForm.new(params[:offers_form])

    if @offers_form.has_user_data_and_valid?
      @offers = Fyber::OfferSearch.new(@offers_form.attributes).fetch
      check_signature
    end
  end

  private

  def check_signature
    response_signature = Fyber::ResponseSignature.new(@offers.response)

    if response_signature.valid?
      respond_with(@offers, status: @offers.response.status)
    else
      respond_with(@offers = [], status: 400)
    end
  end
end
