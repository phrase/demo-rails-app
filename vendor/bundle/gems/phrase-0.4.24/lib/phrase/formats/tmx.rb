# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Tmx < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.tmx"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:tmx]
      end
    end
  end
end
