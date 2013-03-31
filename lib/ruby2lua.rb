require "ruby2lua/version"
require "ruby2lua/compiler"

module Ruby2Lua
  def self.compile!(expr)
    Compiler.new(expr).to_s
  end
end
