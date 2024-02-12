-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_python"

lspconfig.pyright.setup(common.merge({
  command = {installed_path .. PATHSEP .. "package" .. PATHSEP .. "langserver.index.js", "--stdio"}
}, config.plugins.lsp_python or {}))
