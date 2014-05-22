# -*- encoding : utf-8 -*-

require File.expand_path('../options_factory', __FILE__)

class Phrase::Tool::Options
  def initialize(args, command="")
    @command = command
    @data = Phrase::Tool::Commands.possible_commands_with_options
    options.parse!(args)
  end

  def get(name)
    return @data.fetch(command_name).fetch(name.to_sym)
  rescue => _
    $stderr.puts "Invalid or missing option \"#{name}\" for command \"#{command_name}\""
  end

  def set?(name)
    return @data.fetch(command_name)[name.to_sym]
  rescue => _
    $stderr.puts "Invalid command name"
  end

private
  def options
    OptionsFactory.options_for(command_name, @data)
  end

  def command_name
    @command_name ||= (@command.present? and @data.has_key?(@command.to_sym)) ? @command.to_sym : :default
  end
end
