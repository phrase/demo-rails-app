# -*- encoding: utf-8 -*-
# stub: meta-tags 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "meta-tags"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dmytro Shteflyuk"]
  s.date = "2014-04-15"
  s.description = "Search Engine Optimization (SEO) plugin for Ruby on Rails applications."
  s.email = ["kpumuk@kpumuk.info"]
  s.extra_rdoc_files = ["README.md", "CHANGELOG.md"]
  s.files = ["CHANGELOG.md", "README.md"]
  s.homepage = "http://github.com/kpumuk/meta-tags"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.2"
  s.summary = "Collection of SEO helpers for Ruby on Rails."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<bluecloth>, [">= 0"])
    else
      s.add_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<bluecloth>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 3.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<bluecloth>, [">= 0"])
  end
end
