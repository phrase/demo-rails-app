# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class PropertiesXml < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.xml"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:xml]
      end
    end
  end
end
