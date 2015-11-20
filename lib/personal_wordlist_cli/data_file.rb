module PersonalWordlistCLI
  class DataFile
    def initialize(path)
      @file_content = File.read(path)
    end

    def parse_json
      JSON.parse @file_content, symbolize_names: true
    end
  end
end
