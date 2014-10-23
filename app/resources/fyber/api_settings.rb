module Fyber
  class APISettings < Settingslogic
    source    Rails.root.join('config', 'fyber_api.yml')
    namespace Rails.env
  end
end