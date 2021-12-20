require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module DiveIntoWork

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

module IgcApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone= 'Tokyo'
    config.active_record.default_timezone= :local
    config.i18n.default_locale= :ja
    # config.load_defaults 5.1
    # config.generatorsdo|g|
    #   # この二行の記述で自動生成しない設定を作成しています。
    #   g.assetsfalse
    #   g.helperfalse
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
