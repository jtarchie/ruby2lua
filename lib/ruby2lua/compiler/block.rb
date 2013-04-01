module Ruby2Lua
  class Compiler
    class Block < Base
      def to_s
        expressions = sexp.sexp_body.collect do |s|
          compile(s, s == sexp.sexp_body.last)
        end
        expressions.join("\n")
      end
    end
  end
end