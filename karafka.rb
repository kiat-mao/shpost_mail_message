# frozen_string_literal: true

%w[
  delegate
  English
  waterdrop
  kafka
  envlogic
  thor
  forwardable
  fileutils
  multi_json
  dry-configurable
  dry-validation
  dry/events/publisher
  dry/inflector
  dry/monitor/notifications
  dry/core/constants
  zeitwerk
].each(&method(:require))

# Karafka library
module Karafka
  extend Envlogic

  ENV['RAILS_ENV'] ||= 'development'
  ENV['KARAFKA_ENV'] = ENV['RAILS_ENV']

  require ::File.expand_path('../config/environment', __FILE__)
  Rails.application.eager_load!

  if Karafka::App.env.development?
    Karafka.monitor.subscribe(
      Karafka::CodeReloader.new(
        *Rails.application.reloaders
      )
    )
  end

  class << self
    # @return [Logger] logger that we want to use. Will use ::Karafka::Logger by default
    def logger
      @logger ||= App.config.logger
    end

    # @return [::Karafka::Monitor] monitor that we want to use
    def monitor
      @monitor ||= App.config.monitor
    end

    # @return [String] root path of this gem
    def gem_root
      Pathname.new(File.expand_path('..', __dir__))
    end

    # @return [String] Karafka app root path (user application path)
    def root
      Pathname.new(ENV['KARAFKA_ROOT_DIR'] || File.dirname(ENV['BUNDLE_GEMFILE']))
    end

    # @return [String] path to Karafka gem root core
    def core_root
      Pathname.new(File.expand_path('karafka', __dir__))
    end

    # @return [String] path to a default file that contains booting procedure etc
    # @note By default it is a file called 'karafka.rb' but it can be specified as you wish if you
    #   have Karafka that is merged into a Sinatra/Rails app and karafka.rb is taken.
    #   It will be used for console/consumers/etc
    # @example Standard only-Karafka case
    #   Karafka.boot_file #=> '/home/app_path/karafka.rb'
    # @example Non standard case
    #   KARAFKA_BOOT_FILE='/home/app_path/app.rb'
    #   Karafka.boot_file #=> '/home/app_path/app.rb'
    def boot_file
      Pathname.new(ENV['KARAFKA_BOOT_FILE'] || File.join(Karafka.root, 'karafka.rb'))
    end
  end
end

Zeitwerk::Loader
  .for_gem
  # .tap(&:setup)
  # .tap(&:eager_load)
  # .tap{|l| l.ignore("#{__dir__}/db/")}

Kafka::Consumer.prepend(Karafka::Patches::RubyKafka)

class App < Karafka::App
  setup do |config|
    config.client_id = 'my_application'
    config.backend = :inline
    config.batch_fetching = true
    config.batch_consuming = true
    config.kafka.seed_brokers = %w[kafka://127.0.0.1:9092]
    #for Rails
    config.logger = Rails.logger
  end
end

App.consumer_groups.draw do
  consumer_group :my_group do
    topic :test do
      consumer TopicConsumer
    end
  end
end



