-- mod-version:4 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_c"
local clangd_version = "19.1.2"

lspconfig.clangd.setup(common.merge({
  command = { installed_path .. PATHSEP .. "clangd_" .. clangd_version .. PATHSEP .. "bin" .. PATHSEP .. "clangd" .. (PLATFORM == "Windows" and ".exe" or "") }
}, config.plugins.lsp_c or {}))
