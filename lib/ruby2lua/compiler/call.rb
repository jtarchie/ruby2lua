module Ruby2Lua
  class Compiler
    class Call < Base
      def to_s
        receiver, invoking_method, arglist = sexp.sexp_body
        case invoking_method.to_s
          when '+', '-', '/', '*', '>'
            "#{return_statement}(#{compile(receiver)} #{invoking_method} #{compile(arglist)})"
          else
            invoking_method = sanitized_method_name(invoking_method)
            "#{return_statement}(#{invoking_method}(#{compile(arglist) if arglist}))"
        end

      end

      private

      def return_statement
        root == sexp ? "return " : ""
      end
    end
  end
end