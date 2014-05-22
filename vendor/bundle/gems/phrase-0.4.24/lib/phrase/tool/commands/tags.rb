# -*- encoding : utf-8 -*-

class Phrase::Tool::Commands::Tags < Phrase::Tool::Commands::Base
  def initialize(options, args)
    super(options, args)
    require_auth_token!
  end

  def execute!
    if get_option(:list)
      list_tags
    else
      print_error "Unknown command"
    end
  end

protected
  def list_tags
    begin
      tags = api_client.list_tags
      tags.each do |tag|
        print_message "#{tag["name"]}"
      end
    rescue Exception => e
      print_error "Failure while fetching tags"
      print_server_error(e.message)
    end
  end
end
