# -*- encoding : utf-8 -*-

require 'fileutils'
require 'rubygems'
require 'phrase'

class Phrase::Tool
  autoload :Config, 'phrase/tool/config'
  autoload :Options, 'phrase/tool/options'
  autoload :Formats, 'phrase/formats'
  autoload :Commands, 'phrase/tool/commands'
  autoload :TagValidator, 'phrase/tool/tag_validator'
  autoload :EncodingDetector, 'phrase/tool/encoding_detector'
  autoload :Locale, 'phrase/tool/locale'

  def initialize(argv)
    @args = argv
  end

  def run
    command_name = @args.first
    @options = Phrase::Tool::Options.new(@args, command_name)

    command = case command_name
      when /init/
        Phrase::Tool::Commands::Init.new(@options, @args)
      when /push/
        Phrase::Tool::Commands::Push.new(@options, @args)
      when /pull/
        Phrase::Tool::Commands::Pull.new(@options, @args)
      when /tags/
        Phrase::Tool::Commands::Tags.new(@options, @args)
      else
        if @options.get(:version)
          Phrase::Tool::Commands::ShowVersion.new(@options, @args)
        else
          Phrase::Tool::Commands::ShowHelp.new(@options, @args)
        end
    end
    command.execute!
  end

  def self.config
    @@config_instance ||= Phrase::Tool::Config.new.load
  end
end
