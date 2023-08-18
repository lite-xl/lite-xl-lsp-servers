-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_rust"
local filename
if PLATFORM == "Windows" then
  filename = "rust-analyzer.exe"
elseif PLATFORM == "Mac OS X" then
  filename = "rust-analyzer-x86_64-apple-darwin"
else
  filename = "rust-analyzer-x86_64-unknown-linux-gnu"
end

lspconfig.rust_analyzer.setup(common.merge({
  command = { installed_path .. PATHSEP .. filename }
}, config.plugins.lsp_rust or {}))
