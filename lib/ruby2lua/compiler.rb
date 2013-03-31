require "ruby_parser"

module Ruby2Lua
  class Compiler
    attr_reader :sexp, :code

    def initialize(code)
      @code = code
      @sexp = RubyParser.new.parse(code)
    end

    def to_s
      <<-LUA
        function compiled_function()
          #{compile(@sexp)}
        end
      LUA
    end

    private

    def compile(sexp)
      ret_value = send("handle_#{sexp.sexp_type}", sexp.sexp_body)
      determine_return_statement(sexp, ret_value)
    end

    def determine_return_statement(sexp, ret_value)
      if sexp == @sexp
        case @sexp.sexp_type
          when :call, :lit then "return #{ret_value}"
          when :lasgn then "#{ret_value}\nreturn #{sexp.sexp_body.first}"
          when :block then ret_value
        end
      else
        ret_value
      end
    end

    def handle_call(sexp)
      receiver, operation, arglist = sexp

      "(" + compile(receiver) + operation.to_s + compile(arglist) + ")"
    end

    def handle_lit(sexp)
      sexp.sexp_type.to_s
    end

    def handle_lasgn(sexp)
      name, rhs = sexp
      compiled_statement = compile(rhs)
      "local #{name}=#{compiled_statement}"
    end

    def handle_block(sexp)
      expressions = sexp.collect do |s|
        compile(s)
      end
      expressions[-1] = " return #{expressions[-1]}"
      expressions.join("\n")
    end

    def handle_lvar(sexp)
      sexp.sexp_type.to_s
    end
  end
end