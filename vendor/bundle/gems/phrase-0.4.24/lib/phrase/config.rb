# -*- encoding : utf-8 -*-

class Phrase::Config
  def client_version
    Phrase::CLIENT_VERSION
  end

  def api_version
    Phrase::API_VERSION
  end

  def auth_token
    @@auth_token = "" if !defined? @@auth_token or @@auth_token.nil?
    @@auth_token
  end

  def auth_token=(auth_token)
    @@auth_token = auth_token
  end

  def enabled
    @@enabled = false if !defined? @@enabled or @@enabled.nil?
    @@enabled
  end

  def enabled=(enabled)
    @@enabled = enabled
  end

  def backend
    @@backend ||= Phrase::Backend::PhraseService.new
  end

  def backend=(backend)
    @@backend = backend
  end

  def prefix
    @@prefix ||= "{{__"
  end

  def prefix=(prefix)
    @@prefix = prefix
  end

  def suffix
    @@suffix ||= "__}}"
  end

  def suffix=(suffix)
    @@suffix = suffix
  end

  def js_host
    @@js_host ||= 'phraseapp.com'
  end

  def js_host=(js_host)
    @@js_host = js_host
  end

  def js_use_ssl
    @@js_use_ssl = true if !defined? @@js_use_ssl or @@js_use_ssl.nil?
    @@js_use_ssl
  end

  def js_use_ssl=(js_use_ssl)
    @@js_use_ssl = js_use_ssl
  end

  def cache_key_segments_initial
    @@cache_key_segments_initial ||= ["simple_form"]
  end

  def cache_key_segments_initial=(cache_key_segments_initial=[])
    @@cache_key_segments_initial = cache_key_segments_initial
  end

  def cache_lifetime
    @@cache_lifetime ||= 300
  end

  def cache_lifetime=(cache_lifetime)
    @@cache_lifetime = cache_lifetime
  end

  def ignored_keys
    @@ignored_keys ||= []
  end

  def ignored_keys=(ignored_keys)
    @@ignored_keys = ignored_keys
  end
end
