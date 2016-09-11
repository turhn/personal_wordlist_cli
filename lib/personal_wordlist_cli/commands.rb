require 'personal_wordlist'
require 'json'
require 'thor'

module PersonalWordlistCLI
  class Commands < Thor
    map %w[--version -v] => :__print_version

    desc 'genarate PATTERNFILE', 'Generates wordlist from a pattern file.'
    option :datafile, aliases: '-d', required: true
    option :output, aliases: '-o'
    def generate(pattern_file_path)
      dsl_file = PatternFile.new(pattern_file_path).evaluate!
      data     = DataFile.new(options[:datafile]).parse_json
      result   = PersonalWordlist.send(:generate, data, &dsl_file)
      return puts result unless options[:output]
      f = File.new(options[:output], 'w+')
      f.puts result
      f.close
    end

    desc 'init', 'Create a sample PatternFile on working directory.'
    def init
      pf = File.new 'PatternFile', 'w+'
      pf.puts <<-ruby
# This is a Patternfile for PersonalWordListCLI
# This is Ruby DSL so you can use Ruby syntax to create patterns.

#sequence(0..999) do |n|
#  partial { first_name[0..2].downcase }
#  partial { n.to_s }
#  partial { last_name[0] }
#end

#sequence(0..999) do |n|
#  partial { first_name[0..2].downcase }
#  partial { n.to_s }
#  partial { last_name[0] }
#end
ruby
      pf.close
    end

    desc '--version, -v', 'Prints the version information'
    def __print_version
      puts PersonalWordlistCLI::VERSION
    end
  end
end
