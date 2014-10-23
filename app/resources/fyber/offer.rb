module Fyber
  class Offer
    include Jeckle::Resource
    api :fyber_api
    resource 'offers.json'
    root collection: true

    attribute :title, String
    attribute :thumbnail, Hash
    attribute :payout, String

    DEFAULT_PARAMS = {
      appid:      157,
      device_id:  '2b6f0cc904d137be2e1730235f5664094b831186',
      locale:     :de,
      ip:         '109.235.143.113',
      offer_types: 112
    }

    def self.where(options)
      timestamp = Time.now.to_i
      params    = options.merge(DEFAULT_PARAMS).merge(timestamp: timestamp)
      hash_key  = HashKey.new(params).generate
      criteria  = params.merge(hashkey: hash_key)

      super(criteria)
    end

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