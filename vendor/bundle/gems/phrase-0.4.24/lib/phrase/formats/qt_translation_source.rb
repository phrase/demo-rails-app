# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class QtTranslationSource < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.ts"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:ts]
      end
    end
  end
end
