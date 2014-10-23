module Fyber
  class OfferSearch
    attr_reader :options

    DEFAULT_PARAMS = {
      appid:      157,
      device_id:  '2b6f0cc904d137be2e1730235f5664094b831186',
      locale:     :de,
      ip:         '109.235.143.113',
      offer_types: 112
    }

    def initialize(options)
      @options = options.merge(DEFAULT_PARAMS).merge(timestamp: timestamp)
    end

    def fetch
      Offer.where(criteria)
    end

    private

    def criteria
      options.merge(hashkey: hash_key)
    end

    def hash_key
      HashKey.new(options).generate
    end

    def timestamp
      Time.now.to_i
    end
  end
end