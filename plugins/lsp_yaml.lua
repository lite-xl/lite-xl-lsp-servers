-- mod-version:4

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_yaml" .. PATHSEP .. "yaml-language-server" .. PATHSEP .. "dist" .. PATHSEP .. "index.js"
local node = require "libraries.nodejs"

lspconfig.yamlls.setup(common.merge({
  command = { node.path_bin, installed_path, "--stdio" },
}, config.plugins.lsp_yaml or {}))
