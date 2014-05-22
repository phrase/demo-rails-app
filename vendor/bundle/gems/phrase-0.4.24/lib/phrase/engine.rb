# -*- encoding : utf-8 -*-

require 'phrase'
require 'i18n'

if defined? Rails
  class Phrase::Engine < Rails::Engine
    initializer 'phrase', :after => :disable_dependency_loading do |app|
      require 'phrase/adapters/i18n'
      require 'phrase/adapters/fast_gettext'
      ActionView::Base.send :include, Phrase::ViewHelpers
    end
  end
end
