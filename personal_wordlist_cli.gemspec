$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'personal_wordlist_cli/version'

Gem::Specification.new do |s|
  s.name = 'personal_wordlist_cli'
  s.version = PersonalWordlistCLI::VERSION
  s.summary = 'Generates information aware brute-force dictionaries from given data.'
  s.description = s.summary
  s.homepage = 'https://github.com/turhn/personal_wordlist_cli'

  s.author = 'Turhan Coskun'
  s.email = 'turhancoskun@gmail.com'

  s.files = `git ls-files`.split("\n").reject { |path| path =~ /\.gitignore$/ }
  s.test_files = `git ls-files -- Appraisals {spec,features,gemfiles}/*`.split("\n")

  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename f }
  s.require_paths = ['lib']
  s.required_ruby_version = Gem::Requirement.new('>= 2.0.0')
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.7'
  s.license = 'MIT'
end
