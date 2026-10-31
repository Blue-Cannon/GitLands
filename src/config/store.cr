require "yaml"

module Dkit
  module Config
    PATH = File.expand_path("~/.config/dkit/config.yml")

    def self.load
      return {} of String => String unless File.exists?(PATH)
      YAML.parse(File.read(PATH)).as_h
    rescue
      {} of String => String
    end

    def self.save(data)
      Dir.mkdir_p(File.dirname(PATH))
      File.write(PATH, data.to_yaml)
    end

    def self.token
      load["token"]?.try &.as_s
    end
  end
end
