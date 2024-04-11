-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_clojure"
local filename
if PLATFORM == "Windows" then
  filename = "clojure-lsp.exe"
elseif PLATFORM == "Mac OS X" then
  if ARCH == "aarch64-darwin" then
    filename = "clojure-lsp"
  else
    filename = "clojure-lsp"
  end
else
  if ARCH == "aarch64-linux" then
    filename = "clojure-lsp"
  else
    filename = "clojure-lsp"
  end
end

lspconfig.rust_analyzer.setup(common.merge({
  command = { installed_path .. PATHSEP .. filename }
}, config.plugins.lsp_rust or {}))
