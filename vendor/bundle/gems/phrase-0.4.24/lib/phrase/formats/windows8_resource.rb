# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Windows8Resource < Phrase::Formats::ResxWindowsphone
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.resw"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:resw]
      end
    end
  end
end
