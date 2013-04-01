module Ruby2Lua
  class Compiler
    class Base < Struct.new(:root, :sexp)
      def to_s
        Compiler.const_get(sexp.sexp_type.capitalize).new(root, sexp).to_s
      end

      private

      def compile(sexp, force_return = false)
        Compiler::Base.new(
          force_return ? sexp : root,
          sexp
        ).to_s
      end
    end
  end
end