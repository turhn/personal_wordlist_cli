require 'aruba/cucumber'
require 'personal_wordlist_cli'

Aruba.configure do |config|
  config.command_launcher = :spawn
  config.main_class = PersonalWordlistCLI::Runner
end

