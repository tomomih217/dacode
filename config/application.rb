require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DisableToVanishDacode
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.assets false # assets生成しない
      g.helper false # helper生成しない
      g.test_framework false # test生成しない
      g.skip_routes true # ルーティング生成しない
    end

    # 国際化（デフォルトの言語を日本語にする）
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.i18n.available_locales = %i[ja en]

    # Railsのタイムゾーンを日本時間に設定
    config.time_zone = 'Tokyo'
    # DBのタイムゾーンをOSのタイムゾーンに合わせる設定
    config.active_record.default_timezone = :local
  end
end
