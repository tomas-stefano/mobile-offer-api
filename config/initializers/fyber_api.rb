Jeckle.configure do |config|
  config.register :fyber_api do |api|
    api.base_uri     = 'http://api.sponsorpay.com'
    api.namespaces   = { prefix: 'feed', version: 'v1' }
    api.headers      = { 'Content-Type' => 'application/json' }
    api.logger       = Rails.logger

    api.open_timeout = 2
    api.read_timeout = 5

    api.middlewares do
      request :json
      response :json
    end
  end
end