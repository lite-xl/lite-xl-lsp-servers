-- mod-version:3

local lsp = require("plugins.lsp")
local lspconfig = require("plugins.lsp.config")
local common = require("core.common")
local config = require("core.config")
local core = require("core")

local node = require("libraries.nodejs")

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_haxe"
local server_bin = installed_path .. PATHSEP .. "haxe-language-server" .. PATHSEP .. "server.js"

lsp.add_server(common.merge({
  name = "lsp_haxe",
  language = "haxe",
  command = { node.path_bin, server_bin, "--stdio" },
  verbose = false,
  file_patterns = { "%.hx$", "%.hxml$" },
  settings = {
    haxe = {
      buildCompletionCache = true,
    },
  },
}, config.plugins.lsp_haxe or {}))
