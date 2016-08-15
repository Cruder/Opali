module Opali
  module Router
    class Node
      getter verb, route
      def initialize(@verb : String, @route : String,
                     @method : String, @klass : String)
      end

      def to_s
        "[verb: #{@verb}, route: #{@route}, "\
          "method: #{@method}, klass: #{@klass}]"
      end

      def call_controller(context)
        strs = @klass + "sController"
        controller_call(strs, context, "index")
      end
    end
  end
end
