# -*- encoding : utf-8 -*-

module Phrase
  module Formats
    class NodeJson < Phrase::Formats::Base
      def self.filename_for_locale(locale)
        "#{locale.name}.js"
      end

      def self.locale_aware?
        false
      end

      def self.extensions
        [:js]
      end

      def self.target_directory
        'locales/'
      end
    end
  end
end
