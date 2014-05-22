# -*- encoding : utf-8 -*-

module Phrase
  module HashFlattener
    FLATTEN_SEPARATOR = "."
    SEPARATOR_ESCAPE_CHAR = "\001"

    def self.escape_default_separator(key)
      key.to_s.tr(FLATTEN_SEPARATOR, SEPARATOR_ESCAPE_CHAR)
    end

    def self.flatten(hash, escape, previous_key=nil, &block)
      hash.each_pair do |key, value|
        key = escape_default_separator(key) if escape
        current_key = [previous_key, key].compact.join(FLATTEN_SEPARATOR).to_sym
        yield current_key, value
        flatten(value, escape, current_key, &block) if value.is_a?(Hash)
      end
    end
  end
end
