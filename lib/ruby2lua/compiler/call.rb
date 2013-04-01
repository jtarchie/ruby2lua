module Ruby2Lua
  class Compiler
    class Call < Base
      def to_s
        receiver, invoking_method, arglist = sexp.sexp_body
        case invoking_method.to_s
          when '+', '-', '/', '*'
            "#{return_statement}(#{compile(receiver)} #{invoking_method} #{compile(arglist)})"
          else
            "#{return_statement}(#{invoking_method}())"
        end

      end

      private

      def return_statement
        root == sexp ? "return " : ""
      end
    end
  end
end