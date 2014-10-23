class OffersController < ApplicationController
  def index
    @offers_form = OffersForm.new(params[:offers_form])

    if @offers_form.has_user_data_and_valid?
      @offers = Fyber::OfferSearch.new(@offers_form.attributes).fetch

      respond_with(@offers, status: @offers.response.status)
    end
  end
end