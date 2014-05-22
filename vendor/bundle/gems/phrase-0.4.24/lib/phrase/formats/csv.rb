# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Csv < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.csv"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:csv]
      end
    end
  end
end
