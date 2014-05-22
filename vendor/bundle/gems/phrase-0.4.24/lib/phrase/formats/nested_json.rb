# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class NestedJson < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.json"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:json]
      end
    end
  end
end
