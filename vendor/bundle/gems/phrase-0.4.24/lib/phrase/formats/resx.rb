# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Resx < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.resx"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:resx]
      end
    end
  end
end
