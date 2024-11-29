-- mod-version:3

local lsp = require "plugins.lsp"
local common = require "core.common"
local config = require "core.config"

local node = require "libraries.nodejs"
local haxe = require "libraries.haxe"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_haxe"
local server_bin = installed_path .. PATHSEP .. "haxe-language-server" .. PATHSEP .. "server.js"

config.plugins.lsp_haxe = common.merge({
  name = "lsp_haxe",
  language = "haxe",
  command = { node.path_bin, server_bin, "--stdio" },
  verbose = false,
  file_patterns = { "%.hx$", "%.hxml$" },
  init_options = {
    displayServerConfig = {
      path = haxe.path_bin_haxe
    },
    haxelibConfig = {
      executable = haxe.path_bin_haxelib
    }
  },
  config_spec = {
    name = "Haxe LSP",
    {
      label = "Haxe language executable",
      description = "Path to Haxe executable",
      path = "init_options.displayServerConfig.path",
      type = "STRING",
      default = haxe.path_bin_haxe
    },
    {
      label = "Haxelib executable",
      description = "Path to Haxelib executable",
      path = "init_options.haxelibConfig.executable",
      type = "STRING",
      default = haxe.path_bin_haxelib
    },
  }
}, config.plugins.lsp_haxe or {})

lsp.add_server(config.plugins.lsp_haxe or {})
