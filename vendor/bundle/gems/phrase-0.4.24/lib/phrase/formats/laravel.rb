# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Laravel < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.php"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:php]
      end
    end
  end
end
