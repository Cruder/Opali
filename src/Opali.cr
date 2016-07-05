require "http/server"
require "json"
require "./Opali/*"
require "./Opali/http/*"

module Opali
  class Server
    def initialize(args)
      @config = Opali::Config.new(args)
      @server = HTTP::Server.new(@config.port) do |context|
        time_before = Time.now

        context.response.content_type = "application/json"
        response = { code: Opali::HTTP::Codes::LIST[:ok], status: :ok,
                     path: context.request.path }
        context.response.print response.to_json

        puts "Server respond on #{(Time.now - time_before).hash / 10}µs "\
             "on route \"#{context.request.path}\""
      end
    end

    def start
      @server.listen
    end
  end
end
