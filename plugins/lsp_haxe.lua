-- mod-version:3

local lsp = require("plugins.lsp")
local lspconfig = require("plugins.lsp.config")
local common = require("core.common")
local config = require("core.config")
local core = require("core")

local node = require("libraries.nodejs")
local haxe = require("libraries.haxe")

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_haxe"
local server_bin = installed_path .. PATHSEP .. "haxe-language-server" .. PATHSEP .. "server.js"

config.plugins.lsp_haxe = common.merge({
  name = "lsp_haxe",
  language = "haxe",
  command = { node.path_bin, server_bin, "--stdio" },
  verbose = false,
  file_patterns = { "%.hx$", "%.hxml$" },
  settings = {
    haxe = {
      buildCompletionCache = true,
      executable = haxe.path_bin
    },
  },
  config_spec = {
    name = "Haxe LSP",
    {
      label = "Haxe language executable",
      description = "Path to Haxe language executable",
      path = "settings.haxe.executable",
      type = "STRING",
      default = haxe.path_bin
    },
  }
}, config.plugins.lsp_haxe or {})

lsp.add_server(config.plugins.lsp_haxe or {})
