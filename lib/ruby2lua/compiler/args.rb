module Ruby2Lua
  class Compiler
    class Args < Base
      def to_s
        sexp.sexp_body.join(", ")
      end
    end
  end
end