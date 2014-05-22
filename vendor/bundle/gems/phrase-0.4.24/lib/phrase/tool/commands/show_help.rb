# -*- encoding : utf-8 -*-

class Phrase::Tool::Commands::ShowHelp < Phrase::Tool::Commands::Base
  def initialize(options, args)
    super(options, args)
  end

  def execute!
    show_help
  end

private

  def show_help
    msg = "usage: phrase <command> [<args>]\n"
    Phrase::Tool::Commands.possible_commands.each do |command, suffix|
      msg << "    #{extract_help(command)}\n"
    end

    print_message msg
  end

  def extract_help(command)
    OptionsFactory.options_for(command, {}).help
  end
end
