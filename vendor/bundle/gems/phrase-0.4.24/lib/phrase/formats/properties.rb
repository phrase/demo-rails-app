# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Properties < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.properties"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:properties]
      end
    end
  end
end
