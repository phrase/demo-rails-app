# -*- encoding : utf-8 -*-

require 'ext/all'
require 'colorize'

module Phrase
  autoload :Config, 'phrase/config'

  CLIENT_VERSION = "0.1"
  API_VERSION = "v1"

  class << self

    def config
      Thread.current[:phrase_config] ||= Phrase::Config.new
    end

    def config=(value)
      Thread.current[:phrase_config] = value
    end

    %w(enabled backend prefix suffix auth_token client_version js_host js_use_ssl cache_key_segments_initial cache_lifetime ignored_keys).each do |method|
      module_eval <<-DELEGATORS, __FILE__, __LINE__ + 1
        def #{method}
          config.#{method}
        end
      DELEGATORS

      module_eval <<-DELEGATORS, __FILE__, __LINE__ + 1
        def #{method}=(value)
          config.#{method} = (value)
        end
      DELEGATORS
    end

    def enabled?
      enabled
    end

    def disabled?
      !enabled
    end
  end

  def self.configure
    yield(self.config)
  end

  autoload :ViewHelpers, 'phrase/view_helpers'

  require 'phrase/api'
  require 'phrase/formats'
  require 'phrase/version'
  require 'phrase/engine'
  require 'phrase/backend'
  require 'phrase/delegate'
end

# Only load adapters directly if non-rails app, otherwise use engine
unless defined? Rails
  require 'phrase/adapters/i18n'
  require 'phrase/adapters/fast_gettext'
end
