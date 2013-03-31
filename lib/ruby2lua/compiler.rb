require "ruby_parser"

require "ruby2lua/compiler/base"
require "ruby2lua/compiler/block"
require "ruby2lua/compiler/call"
require "ruby2lua/compiler/lasgn"
require "ruby2lua/compiler/lvar"
require "ruby2lua/compiler/lit"

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
      Compiler::Base.new(@sexp, sexp).to_s
    end
  end
end