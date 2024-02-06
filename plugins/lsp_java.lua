-- mod-version:3 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_java"

lspconfig.jdtls.setup(common.merge({
  command = { installed_path .. PATHSEP .. "bin" .. PATHSEP .. "jdtls" }
}, config.plugins.lsp_java or {}))
