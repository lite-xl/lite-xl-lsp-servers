-- Author: Rohan Vashisht: https://github.com/RohanVashisht1234

-- mod-version:4

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_clojure"

lspconfig.clojure_lsp.setup(common.merge({
  command = { installed_path .. PATHSEP .. "clojure-lsp" .. (PLATFORM == "Windows" and ".exe" or "") }
}, config.plugins.lsp_clojure or {}))
