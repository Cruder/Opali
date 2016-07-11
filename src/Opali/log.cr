require "colorize"

module Opali
  class Log

    @@file_handler = LogHandler.new

    def self.message(str : String)
      write "M", str
    end

    def self.error(str : String)
      write "E", str, :red
    end

    def self.info(str : String)
      write "I", str, :cyan
    end

    def self.warning(str : String)
      write "W", str, :yellow
    end

    def self.spacer
      @@file_handler.write "===========================\n"
    end

    private def self.write(kind : String, message : String, color : Symbol = :white)
      str = "[#{kind}](#{Time.now}) => #{message}\n"
      @@file_handler.write str
      print str.colorize color
    end
  end
end
