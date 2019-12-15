module CodebreakerAp
  module Storage
    def save_to_file(data, file_name)
      File.open(file_name, 'a+') do |this_file|
        this_file.write(YAML.dump(data))
      end
    end

    def read_from_file(file_name)
      YAML.load_file(file_name) if File.exist? file_name
    end
  end
end
