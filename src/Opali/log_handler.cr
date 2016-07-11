module Opali
  class LogHandler
    FILE_PATH = "log/"
    FILE_NAME = "daily.log"

    @handler : IO::FileDescriptor
    getter handler

    STARTUP_MESSAGE = "===========================
[#{Time.now}] => Startup
===========================\n"

    def initialize
      Dir.mkdir FILE_PATH unless Dir.exists? FILE_PATH
      puts "Open log on #{FILE_PATH + FILE_NAME}"
      @handler = File.open FILE_PATH + FILE_NAME, "a"
      @handler.flush_on_newline = true
      write STARTUP_MESSAGE
    end

    def write(str : String)
      @handler.write str.to_slice
    end
  end
end
