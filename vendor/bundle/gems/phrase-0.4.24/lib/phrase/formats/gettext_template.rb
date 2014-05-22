# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class GettextTemplate < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.pot"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:pot]
      end
    end
  end
end
