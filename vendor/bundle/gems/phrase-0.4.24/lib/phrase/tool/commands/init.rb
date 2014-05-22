# -*- encoding : utf-8 -*-

class Phrase::Tool::Commands::Init < Phrase::Tool::Commands::Base
  def initialize(options, args)
    super(options, args)
  end

  def execute!
    secret = get_option(:secret)
    if secret.present?
      config.secret = secret
      print_message "Wrote secret to config file .phrase"
      config.default_locale = get_option(:default_locale)
      create_locale(config.default_locale)
      make_locale_default(config.default_locale)
      config.format = get_option(:format)
      config.target_directory = get_option(:target_directory)
      config.domain = get_option(:domain)
      config.locale_directory = get_option(:locale_directory)
      config.locale_filename = get_option(:locale_filename)
    else
      print_auth_token_error
      exit_command
    end
  end

private
  def create_locale(name)
    begin
      api_client.create_locale(name)
      print_message "Created locale \"#{name}\"".green
    rescue Exception => e
      print_message "Notice: Locale \"#{name}\" could not be created (maybe it already exists)".light_red
    end
  end

  def make_locale_default(name)
    begin
      api_client.make_locale_default(name)
      print_message "Locale \"#{name}\" is now the default locale".green
    rescue Exception => e
      print_message "Notice: Locale \"#{name}\" could not be made the default locale".light_red
      print_server_error(e.message)
    end
  end

  def print_auth_token_error
    print_error "No auth token was given"
    print_error "Please provide the --secret=YOUR_SECRET parameter."
  end
end
