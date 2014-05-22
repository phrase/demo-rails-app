# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class Ini < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "phrase.#{locale.name}.ini"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:ini]
      end
    end
  end
end
