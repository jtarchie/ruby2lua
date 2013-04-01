module Ruby2Lua
  class Compiler
    class Lvar < Base
      def to_s
        return_statement + sexp.sexp_body.sexp_type.to_s
      end

      private

      def return_statement
        root == sexp ? "return " : ""
      end
    end
  end
end