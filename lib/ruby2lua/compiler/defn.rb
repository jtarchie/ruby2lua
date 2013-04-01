module Ruby2Lua
  class Compiler
    class Defn < Base
      def to_s
        method_name, arguments, expression = sexp.sexp_body
        <<-LUA
          function #{method_name}()
            #{compile(expression, true)}
          end
        LUA
      end
    end
  end
end