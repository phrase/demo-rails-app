# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Gettext < Phrase::Formats::Base
      def self.directory_for_locale(locale)
        "./#{locale.name}/"
      end

      def self.filename_for_locale(locale)
        "#{config.domain}.po"
      end

      def self.target_directory
        "locales/"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:po]
      end
    end
  end
end
