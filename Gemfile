if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '~> 3.2.22.1'

gem 'ey_config', '0.0.6'
gem 'jquery-rails', '~> 3.0'
gem 'rails_autolink', '~> 1.1'
gem 'simple_form', '~> 2.1'
gem 'phraseapp-in-context-editor-ruby'
gem 'puma', '~> 5.6'
gem 'pg'

gem 'newrelic_rpm', '~> 3.6'
gem 'unicorn', '~> 4.7'

gem 'json', '~> 1.8'
gem 'minitest', '~> 4.7'
gem 'psych', '~> 2.0'
gem 'racc', '~> 1.4'
gem 'meta-tags'
gem 'test-unit'

group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '~> 2.3'
end

group :development do
  gem 'sqlite3', '1.3.10' # 1.3.9 broken on rbx
end
