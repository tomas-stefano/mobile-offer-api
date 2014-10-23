module Fyber
  class Offer
    include Jeckle::Resource
    api :fyber_api
    resource 'offers.json'
    root collection: true

    attribute :title, String
    attribute :thumbnail, Hash
    attribute :payout, String

    def thumbnail
      @thumbnail || {}
    end

    def thumbnail_low_resolution
      thumbnail['lowres'].to_s
    end

    def to_partial_path
      'offers/offer'
    end
  end
end
