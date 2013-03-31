module Ruby2Lua
  class Compiler
    class Lasgn < Base
      def to_s
        name, rhs = sexp.sexp_body
        compiled_statement = compile(rhs)
        ret_val = "local #{name}=#{compiled_statement}"

        if sexp == root
          "#{ret_val}\nreturn #{name}"
        else
          ret_val
        end
      end
    end
  end
end