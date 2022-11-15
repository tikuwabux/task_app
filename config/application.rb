require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application
    
    # paramsで取得する値のデフォルト値を設定
    config.action_controller.permit_all_parameters = true
     
    # デフォルトの協定世界時から､日本標準時に変更する
    config.time_zone = 'Tokyo'
    
    # gem rails-i18nを用いて､
    # デフォルトのロケール(言語や国･地域の設定)を日本にする
    config.i18n.default_locale = :ja
  end
end
