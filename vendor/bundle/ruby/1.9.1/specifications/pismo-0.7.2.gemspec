# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pismo"
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Cooper"]
  s.date = "2010-07-27"
  s.description = "Pismo extracts and retrieves content-related metadata from HTML pages - you can use the resulting data in an organized way, such as a summary/first paragraph, body text, keywords, RSS feed URL, favicon, etc."
  s.email = ["git@peterc.org"]
  s.executables = ["pismo"]
  s.files = ["bin/pismo"]
  s.homepage = "http://github.com/peterc/pismo"
  s.require_paths = ["lib"]
  s.rubyforge_project = "pismo"
  s.rubygems_version = "1.8.24"
  s.summary = "Extracts or retrieves content-related metadata from HTML pages"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<awesome_print>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<sanitize>, [">= 0"])
      s.add_runtime_dependency(%q<fast-stemmer>, [">= 0"])
      s.add_runtime_dependency(%q<chronic>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<sanitize>, [">= 0"])
      s.add_dependency(%q<fast-stemmer>, [">= 0"])
      s.add_dependency(%q<chronic>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<sanitize>, [">= 0"])
    s.add_dependency(%q<fast-stemmer>, [">= 0"])
    s.add_dependency(%q<chronic>, [">= 0"])
  end
end
