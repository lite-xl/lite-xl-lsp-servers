-- Author: Rohan Vashisht: https://github.com/RohanVashisht1234

-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_v"

lspconfig.v_analyzer.setup(common.merge({
  command = { installed_path .. PATHSEP .. "v-analyzer" .. (PLATFORM == "Windows" and ".exe" or "") }
}, config.plugins.lsp_v or {}))
