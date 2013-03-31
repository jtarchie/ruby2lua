module Ruby2Lua
  class Compiler
    class Call < Base
      def to_s
        receiver, operation, arglist = sexp.sexp_body
        return_statement + "(" + compile(receiver) + operation.to_s + compile(arglist) + ")"
      end

      private

      def return_statement
        root == sexp ? "return " : ""
      end
    end
  end
end