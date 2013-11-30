# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rus_bank"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["wilDAlex"]
  s.date = "2013-11-30"
  s.description = "\u{41d}\u{430}\u{431}\u{43e}\u{440} ruby-\u{43c}\u{435}\u{442}\u{43e}\u{434}\u{43e}\u{432} \u{434}\u{43b}\u{44f} \u{440}\u{430}\u{431}\u{43e}\u{442}\u{44b} \u{441} \u{441}\u{435}\u{440}\u{432}\u{438}\u{441}\u{430}\u{43c}\u{438} \u{426}\u{411} \u{420}\u{424}"
  s.email = "some@wild-x.ru"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rus_bank.rb",
    "rus_bank.gemspec",
    "test/helper.rb",
    "test/test_rus_bank.rb"
  ]
  s.homepage = "http://github.com/wildDAlex/rus_bank"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "Ruby-\u{438}\u{43d}\u{442}\u{435}\u{440}\u{444}\u{435}\u{439}\u{441} \u{434}\u{43b}\u{44f} \u{43f}\u{43e}\u{43b}\u{443}\u{447}\u{435}\u{43d}\u{438}\u{44f} \u{438}\u{43d}\u{444}\u{43e}\u{440}\u{43c}\u{430}\u{446}\u{438}\u{438} \u{43f}\u{43e} \u{440}\u{43e}\u{441}\u{441}\u{438}\u{439}\u{441}\u{43a}\u{438}\u{43c} \u{431}\u{430}\u{43d}\u{43a}\u{430}\u{43c}"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<savon>, ["~> 2.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
    else
      s.add_dependency(%q<savon>, ["~> 2.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    end
  else
    s.add_dependency(%q<savon>, ["~> 2.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
  end
end

