# -*- encoding : utf-8 -*-

class Phrase::Tool::Commands::ShowVersion < Phrase::Tool::Commands::Base
  def initialize(options, args)
    super(options, args)
  end

  def execute!
    show_version
  end

private

  def show_version
    print_message "phrase version #{Phrase::VERSION}"
  end
end
