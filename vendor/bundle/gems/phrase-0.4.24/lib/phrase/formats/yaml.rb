# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Yaml < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.yml"
      end

      def self.locale_aware?
        true
      end

      def self.extensions
        [:yml]
      end
    end
  end
end
