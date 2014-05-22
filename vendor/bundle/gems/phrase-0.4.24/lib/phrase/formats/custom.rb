# -*- encoding : utf-8 -*-

class Phrase::Formats::Custom < Phrase::Formats::Base
  def self.directory_for_locale(locale, format)
    setting = config.locale_directory
    return unless setting
    parse(setting, locale, format)
  end

  def self.filename_for_locale(locale, format)
    setting = config.locale_filename
    return unless setting
    parse(setting, locale, format)
  end

  def self.target_directory
    config.target_directory
  end

  def self.parse(str, locale, format)
    str.gsub(/#{regexp(locale, format)}/) do |match|
      replacements(locale, format)[match]
    end
  end
  private_class_method :parse

  def self.regexp(locale, format)
    "(#{replacements(locale, format).keys.join('|')})"
  end

  def self.replacements(locale, format)
    {
      '<domain>' => config.domain,
      '<format>' => format,
      '<locale.name>' => locale.name,
      '<locale.code>' => locale.code,
      '<locale>' => locale.name
    }
  end
end
