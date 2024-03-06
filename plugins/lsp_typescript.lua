-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_typescript" .. PATHSEP .. "tsserver" .. PATHSEP .. "lib" .. PATHSEP .. "cli.mjs"
local node = require "libraries.nodejs"

lspconfig.tsserver.setup(common.merge({
  command = { node.path_bin, installed_path, "--stdio" }
}, config.plugins.lsp_typescript or {}))
