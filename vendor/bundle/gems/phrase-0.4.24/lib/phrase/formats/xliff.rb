# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Xliff < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.xlf"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:xlf, :xliff]
      end
    end
  end
end
