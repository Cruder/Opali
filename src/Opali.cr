require "http/server"
require "json"
require "./Opali/*"

module Opali
  class Server
    def initialize(args)
      @config = Opali::Config.new(args)
      @server = HTTP::Server.new(@config.port) do |context|
        context.response.content_type = "application/json"
        response = { code: 200, status: :ok }
        context.response.print response.to_json
      end
    end

    def start
      pp @server
      @server.listen
    end
  end
end
