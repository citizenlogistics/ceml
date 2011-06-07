# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ceml}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Edelman"]
  s.date = %q{2011-06-07}
  s.description = %q{a language for coordinating real world events}
  s.email = %q{joe@citizenlogistics.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "Makefile",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "ceml.gemspec",
    "cemltest",
    "editors/CEML.tmbundle/Syntaxes/ceml.tmLanguage",
    "editors/CEML.tmbundle/info.plist",
    "examples/breakfast-exchange.ceml",
    "examples/citizen-investigation.ceml",
    "examples/high-fives.ceml",
    "guide/guide.html",
    "guide/guide.md",
    "guide/guide.pdf",
    "lib/ceml.rb",
    "lib/ceml/driver.rb",
    "lib/ceml/lang.rb",
    "lib/ceml/lang/basic_instruction.rb",
    "lib/ceml/lang/casting_statement.rb",
    "lib/ceml/lang/instruction_statements.rb",
    "lib/ceml/lang/script.rb",
    "lib/ceml/lang/tt/casting.rb",
    "lib/ceml/lang/tt/casting.treetop",
    "lib/ceml/lang/tt/instructions.rb",
    "lib/ceml/lang/tt/instructions.treetop",
    "lib/ceml/lang/tt/lexer.rb",
    "lib/ceml/lang/tt/lexer.treetop",
    "lib/ceml/lang/tt/scripts.rb",
    "lib/ceml/lang/tt/scripts.treetop",
    "lib/ceml/models.rb",
    "lib/ceml/models/bundle.rb",
    "lib/ceml/models/cast.rb",
    "lib/ceml/models/castable.rb",
    "lib/ceml/models/casting_pool.rb",
    "lib/ceml/models/casting_tokens.rb",
    "lib/ceml/models/incident.rb",
    "lib/ceml/models/incident_model.rb",
    "lib/ceml/models/incident_role_slot.rb",
    "lib/ceml/models/player.rb",
    "lib/ceml/models/queue.rb",
    "lib/ceml/models/waiting_room.rb",
    "lib/ceml/processor.rb",
    "lib/ceml/recognizer.rb",
    "test/askchain.ceml",
    "test/compliment.ceml",
    "test/dialogues/accept.ceml",
    "test/dialogues/basic_seed.ceml",
    "test/dialogues/jordan.ceml",
    "test/helper.rb",
    "test/jane.ceml",
    "test/lang/test_casting.rb",
    "test/lang/test_instructions.rb",
    "test/lang/test_scripts.rb",
    "test/sync.ceml",
    "test/test_castable.rb",
    "test/test_dialogues.rb",
    "test/test_incident.rb",
    "try"
  ]
  s.homepage = %q{http://github.com/citizenlogistics/ceml}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{a language for coordinating real world events}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<treetop>, [">= 0"])
    else
      s.add_dependency(%q<treetop>, [">= 0"])
    end
  else
    s.add_dependency(%q<treetop>, [">= 0"])
  end
end

