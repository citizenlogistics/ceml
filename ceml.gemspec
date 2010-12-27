# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ceml}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Edelman"]
  s.date = %q{2010-12-26}
  s.description = %q{a language for coordinating real world events}
  s.email = %q{joe@citizenlogistics.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "Makefile",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "beginners-guide.md",
     "editors/CEML.tmbundle/Syntaxes/ceml.tmLanguage",
     "editors/CEML.tmbundle/info.plist",
     "examples/breakfast-exchange.ceml",
     "examples/citizen-investigation.ceml",
     "examples/high-fives.ceml",
     "lib/ceml.rb",
     "lib/ceml/casting.rb",
     "lib/ceml/casting_criterion.rb",
     "lib/ceml/incident.rb",
     "lib/ceml/instructions.rb",
     "lib/ceml/script.rb",
     "lib/ceml/tt/casting.treetop",
     "lib/ceml/tt/instructions.treetop",
     "lib/ceml/tt/lexer.treetop",
     "lib/ceml/tt/scripts.treetop",
     "test/helper.rb",
     "test/test_casting.rb",
     "test/test_incident.rb",
     "test/test_instructions.rb",
     "test/test_scripts.rb",
     "try"
  ]
  s.homepage = %q{http://github.com/citizenlogistics/ceml}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{a language for coordinating real world events}
  s.test_files = [
    "test/helper.rb",
     "test/test_casting.rb",
     "test/test_incident.rb",
     "test/test_instructions.rb",
     "test/test_scripts.rb",
     "examples/sample_delegate.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<treetop>, [">= 0"])
    else
      s.add_dependency(%q<treetop>, [">= 0"])
    end
  else
    s.add_dependency(%q<treetop>, [">= 0"])
  end
end

