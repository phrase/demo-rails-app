# -*- encoding : utf-8 -*-

require "phrase/tool"

module Phrase
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a PhraseApp initializer for your application."
      class_option :auth_token, type: :string, desc: "Your PhraseApp project authentication token", required: true
      class_option :default_locale, type: :string, desc: "The name of yout default (source) locale, usually 'en'", required: false, default: "en"

      def copy_initializer
        template "phrase.rb", "config/initializers/phrase.rb"
      end

      def init_phrase
        # It is probably preferred to just invoke phrase init via #run
        # but this version can be mocked so much better via VCR
        tool = Phrase::Tool.new(["init", "--secret=#{options[:auth_token]}", "--default-locale=#{options[:default_locale]}"])
        tool.run
      end

      def set_locale_load_path
        application(nil, env: "production") do
          "# Uncomment the new i18n load path setting if you have prepared your locale files to be served from PhraseApp\n" <<
          "  # config.i18n.load_path = Dir[Rails.root.join('phrase', 'locales', '*.{yml}').to_s]\n"
        end
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
