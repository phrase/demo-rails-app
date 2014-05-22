# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Plist < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.plist"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:plist]
      end
    end
  end
end
