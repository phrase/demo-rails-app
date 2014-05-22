# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class QtPhraseBook < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.qph"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:qph]
      end
    end
  end
end
