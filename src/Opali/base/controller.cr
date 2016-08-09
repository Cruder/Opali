macro controller_call(controller, params, name)
  {{controller.id}}.new({{params}}).{{name.id}}()
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
