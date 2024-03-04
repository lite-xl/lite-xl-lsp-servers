-- mod-version:3 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_c"

lspconfig.clangd.setup(common.merge({
  command = { installed_path .. PATHSEP .. "clangd_17.0.3" .. PATHSEP .. "bin" .. PATHSEP .. "clangd" .. (PLATFORM == "Windows" and ".exe" or "") }
}, config.plugins.lsp_c or {}))
