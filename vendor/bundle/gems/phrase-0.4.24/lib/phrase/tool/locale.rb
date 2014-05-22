# -*- encoding : utf-8 -*-

class Phrase::Tool::Locale
  attr_accessor :id, :name, :code, :is_default

  def initialize(attrs={})
    attrs.each do |key,value|
      self.send("#{key}=", value)
    end
  end

  def default?
    self.is_default == true
  end

  def ==(object)
    object.id == self.id
  end

  def self.find_default_locale
    all.select { |locale| locale.default? }.try(:first)
  end

  def self.all
    locales = []
    api_client.fetch_locales.each do |locale|
      locales << Phrase::Tool::Locale.new(id: locale[:id], name: locale[:name], code: locale[:code], is_default: locale[:is_default])
    end
    locales
  end

  def self.config
    Phrase::Tool.config
  end
  private_class_method :config

  def self.api_client
    Phrase::Api::Client.new(config.secret)
  end
  private_class_method :api_client
end
