require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Igclone
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators do |g|
      a.assets false
      a.helper false
      a.jbuilder false
    end
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
