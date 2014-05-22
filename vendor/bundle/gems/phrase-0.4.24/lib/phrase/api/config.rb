# -*- encoding : utf-8 -*-

require 'phrase'
require 'phrase/api'

class Phrase::Api::Config
  def self.api_port
    ENV.fetch("PHRASE_API_PORT", "443")
  end

  def self.api_host
    ENV.fetch("PHRASE_API_HOST", "phraseapp.com")
  end

  def self.api_path_prefix
    "/api/#{Phrase::API_VERSION}"
  end

  def self.api_use_ssl?
    ENV.fetch("PHRASE_API_USE_SSL", "1") == "1"
  end

  def self.api_max_retries
    ENV.fetch("PHRASE_API_MAX_RETRIES", 3).to_i
  end

  def self.skip_ssl_validation?
    ENV.fetch("PHRASE_API_SKIP_SSL_VALIDATION", "0") == "1"
  end
end
