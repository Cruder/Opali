require "colorize"

module Opali
  class Log
    FILE_PATH = "log/"
    FILE_NAME = "daily.log"

    def self.message(str)
      write "M", str
    end

    def self.error(str)
      write "E", str, :red
    end

    def self.info(str)
      write "I", str, :cyan
    end

    def self.warning(str)
      write "W", str, :yellow
    end

    def self.write(kind : String, message : String, color : Symbol = :white)
      str = "[#{kind}](#{Time.now}) => #{message}"
      puts str.colorize(color)
      Dir.mkdir FILE_PATH unless Dir.exists? FILE_PATH
      File.write FILE_PATH + FILE_NAME, str
    end
  end
end
