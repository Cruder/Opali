require "yaml"
require "./node.cr"

module Opali
  module Router
    class Router
      property routes
      def initialize(filename : String = "config/routes.yml")
        data = YAML.parse(File.read(filename))
        @routes = [] of Node
        set_route(data["collections"])
      end

      def list_routes
        @routes.each do |route|
          puts route.route
        end
      end

      def call_route(route : String, params : HTTP::Request)
        @routes.each do |r|
          return r.call_controller(params) if route == r.route
        end
        {
          "code" => "404",
          "name" => "not found"
        }.to_json
      end

      private def set_route(routes)
        routes.each do |base, values|
          base = "/" + base.to_s
          klass = values["klass"].to_s
          values["verbs"].to_s.each_char do |v|
            case v
            when 'C' then create_route(base, klass)
            when 'R' then read_route(base, klass)
            when 'U' then update_route(base, klass)
            when 'D' then delete_route(base, klass)
            end
          end
          values["collection_actions"].each do |verb, value|
            verb = verb.to_s.upcase
            value.each { |v| add_route(verb, base, v.to_s, klass, false) }
          end if values.as_h.has_key?("collection_actions")

          values["resource_actions"].each do |verb, value|
            verb = verb.to_s.upcase
            value.each { |v| add_route(verb, base, v.to_s, klass, true) }
          end if values.as_h.has_key?("collection_actions")
        end
      end

      private def create_route(base : String, klass : String)
        @routes += [Node.new("POST", base, "create", klass)]
      end

      private def read_route(base : String, klass : String)
        @routes += [Node.new("GET", base, "index", klass)]
        @routes += [Node.new("GET", base + "/:id", "show", klass)]
      end

      private def update_route(base : String, klass : String)
        @routes += [Node.new("PATCH", base + "/:id", "update", klass)]
        @routes += [Node.new("PUT", base + "/:id", "update", klass)]
      end

      private def delete_route(base : String, klass : String)
        @routes += [Node.new("DELETE", base + "/:id", "delete", klass)]
      end

      private def add_route(verb : String, base : String, method : String,
                            klass : String, id : Bool)
        sup = id ? "/:id/" : "/"
        @routes += [Node.new(verb, base + sup + method, method, klass)]
      end
    end
  end
end
