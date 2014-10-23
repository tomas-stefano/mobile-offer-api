class OffersController < ApplicationController
  def index
    @offers_form = OffersForm.new(params[:offers_form])

    if @offers_form.has_user_data_and_valid?
      @offers = Fyber::Offer.where(@offers_form.attributes)

      respond_with(@offers, status: @offers.response.status)
    end
  end
end