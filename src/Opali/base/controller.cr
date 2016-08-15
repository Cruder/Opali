macro controller_call(controller, params, method)
  puts "-----------------------------"
  teste = {{controller}}.class
  pp teste.class
  pp {{params}}.class
  pp {{controller.id}}
  puts "-----------------------------"
  teste.new({{params}}).index
  # {{controller}}.new({{params}}).{{method.id}}()
end

module Opali
  module Base
    class Controller
      @post : JSON::Any | Nil
      @get  : Hash(String, Array(String))
      property post, get
      def initialize(params)
        @post = JSON.parse(params.body || "{}")
        @get  = get_params(params.query_params)
      end

      private def get_params(params : HTTP::Params)
        res = {} of String => Array(String)
        params.each do |k, v|
          begin
            res[k] = [v]
          rescue
            res[k] << v
          end
        end
      end
    end # Controller
  end # Base
end # Opali

# print "controller_call\n"
# %ctrl = {{controller}} + "sController"
# pp %ctrl
#
# print "end controller_call\n"
