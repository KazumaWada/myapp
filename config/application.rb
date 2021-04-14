require_relative "boot"
#impressionistのエラー解決



require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'date'



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1



   #fakerの日本語化
    config.i18n.available_locales = %i[ja en]
    config.i18n.default_locale = :ja


    # config.action_view.embed_authenticity_token_in_remote_forms = true

    #logger https://railsguides.jp/debugging_rails_applications.html#%E3%83%AD%E3%82%AC%E3%83%BC
    # config.logger = Logger.new(STDOUT)
    # config.logger = Log4r::Logger.new("Application Log")
    # Rails.logger.level = 0 


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true



    #rails g controlerしたら、自動でRSpecも作ってくれる。
    config.generators do |g|
      g.test_framework :rspec,
      fixtures: false,
      view_specs: false,
      helper_specs: false,
      routing_specs: false
    end
      #rails g controlerしたら、自動でRSpecも作ってくれる。
  end

  #rspevでrails g するときのための設定。
  # config.generators do |g|
  #   g.test_framework :rspec,
  #                    fixtures: true,
  #                    view_specs: false,
  #                    helper_specs: false,
  #                    routing_specs: false,
  #                    controller_specs: true,
  #                    request_specs: false
  #   g.fixture_replacement :factory_bot, dir: "spec/factories"
  # end
end