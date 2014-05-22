# -*- encoding : utf-8 -*-

require 'phrase'
require 'phrase/api'

module Phrase::Api::Exceptions
  class Unauthorized < StandardError; end
  class ServerError < StandardError; end
end
