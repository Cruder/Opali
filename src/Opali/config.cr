module Opali
  class Config
    getter :port

    LOGO = "
    ___             _ _
   / _ \\ _ __  __ _| (_)
  | (_) | '_ \\/ _` | | |
   \\___/| .__/\\__,_|_|_|
        |_|"
    def initialize(args)
      @port = args[:port] || 3000

      puts LOGO
      puts message
    end

    private def message
      "Welcome to Opali API server.\n"\
      "The server is open on port #{@port}"
    end
  end
end
