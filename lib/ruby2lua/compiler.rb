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
          return #{@code}
        end
      LUA
    end
  end
end