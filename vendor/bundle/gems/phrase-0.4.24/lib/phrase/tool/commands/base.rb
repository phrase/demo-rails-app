# -*- encoding : utf-8 -*-

module Phrase::Tool::Commands
  class Base
    def initialize(options, args=[])
      @options = options
      @args = args
      config.overwrite!('secret', options.get('secret')) if options.set?('secret')
    end

    def execute!
      raise "not implemented"
    end

    def require_auth_token!
      unless config.secret and config.secret.present?
        print_error "No auth token present. You need to initialize phrase first."
        exit_command
      end
    end

    def self.print_error(msg)
      $stderr.puts msg.red
    end

    def self.print_server_error(msg, location=nil)
      error_message = "#{msg}"
      error_message << " (#{location})" unless location.nil?
      print_error error_message
    end

    def self.print_message(msg)
      $stdout.puts msg
    end

    def self.exit_command(status = false)
      exit(status)
    end

  protected
    def get_option(name)
      options.get(name)
    end

    def api_client
      Phrase::Api::Client.new(config.secret)
    end

    def config
      Phrase::Tool.config
    end

    def options
      @options
    end

    def print_error(msg)
      self.class.print_error(msg)
    end

    def print_server_error(message, location=nil)
      self.class.print_server_error(message, location)
    end

    def print_message(msg)
      self.class.print_message(msg)
    end

    def exit_command(status = false)
      self.class.exit_command(status)
    end
  end
end
