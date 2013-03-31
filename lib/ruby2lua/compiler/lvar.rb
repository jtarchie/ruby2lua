module Ruby2Lua
  class Compiler
    class Lvar < Base
      def to_s
        sexp.sexp_body.sexp_type.to_s
      end
    end
  end
end