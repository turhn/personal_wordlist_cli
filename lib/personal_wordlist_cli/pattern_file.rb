module PersonalWordlistCLI
  class PatternFile
    def initialize(path)
      @file_content = File.read(path)
    end

    def evaluate!
      eval "proc { #{@file_content} }"
    end
  end
end
