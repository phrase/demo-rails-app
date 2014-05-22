# -*- encoding : utf-8 -*-

require 'json'

class Phrase::Tool::Config
  def load
    @config = {}
    if File.exist?(".phrase")
      begin
        contents = File.read(".phrase")
        @config = JSON.parse(contents)
      rescue JSON::ParserError => err
        $stderr.puts "Could not parse config file: #{err}"
      end
    end
    self
  end

  def reset!
    @config = {}
    @overwrites = {}
  end

  def overwrite!(var, value)
    @overwrites ||= {}
    @overwrites[var.to_s] = value
  end

  def overwrite_for(var)
    @overwrites ||= {}
    @overwrites[var.to_s]
  end

  def secret
    get_setting("secret")
  end

  def secret=(new_secret)
    config["secret"] = new_secret
    save_config!
  end

  def default_locale
    get_setting("default_locale")
  end

  def default_locale=(new_default_locale)
    config["default_locale"] = new_default_locale
    save_config!
  end

  def domain
    get_setting("domain") || 'phrase'
  end

  def domain=(new_domain)
    config["domain"] = new_domain
    save_config!
  end

  def format
    get_setting("format")
  end

  def format=(new_domain)
    config["format"] = new_domain
    save_config!
  end

  def target_directory
    get_setting("target_directory")
  end

  def target_directory=(new_domain)
    config["target_directory"] = new_domain
    save_config!
  end

  def locale_directory
    get_setting("locale_directory")
  end

  def locale_directory=(new_domain)
    config["locale_directory"] = new_domain
    save_config!
  end

  def locale_filename
    get_setting("locale_filename")
  end

  def locale_filename=(new_domain)
    config["locale_filename"] = new_domain
    save_config!
  end

private
  def config
    @config ||= {}
  end

  def get_setting(var)
    overwrite_for(var) || config[var]
  end

  def save_config!
    File.open(".phrase", "w+") do |file|
      file.write(JSON.pretty_generate(config))
    end
  end
end
