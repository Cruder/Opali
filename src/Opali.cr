require "http/server"
require "json"
require "./Opali/**"

module Opali
  class Server
    def initialize(args)
      @router = Router::Router.new
      @config = Opali::Config.new(args)
      @server = HTTP::Server.new("0.0.0.0", @config.port) do |context|
        time_before = Time.now

        context.response.content_type = "application/json"
        response = { code: Opali::HTTP::Codes::LIST[:ok], status: :ok,
                     path: context.request.path }
        # controller_call("UsersController", context.request, "index")
        rst = @router.call_route(context.request.path.not_nil!, context.request)
        pp rst
        context.response.print rst
        puts "Server respond on #{(Time.now - time_before).hash / 10}µs "\
             "on route \"#{context.request.path}\""
      end
    end

    def start
      @server.listen
    end
  end
end
