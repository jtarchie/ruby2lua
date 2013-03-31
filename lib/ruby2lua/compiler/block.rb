module Ruby2Lua
  class Compiler
    class Block < Base
      def to_s
        expressions = sexp.sexp_body.collect do |s|
          compile(s)
        end
        expressions[-1] = " return #{expressions[-1]}"
        expressions.join("\n")
      end
    end
  end
end