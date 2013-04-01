module Ruby2Lua
  class Compiler
    class Defn < Base
      def to_s
        method_name, arguments, expression = sexp.sexp_body
        method_name = sanitized_method_name(method_name)
        <<-LUA
          function #{method_name}(#{compile(arguments)})
            #{compile(expression, true)}
          end
        LUA
      end
    end
  end
end