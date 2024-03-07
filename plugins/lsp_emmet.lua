-- mod-version:3

local lsp = require "plugins.lsp"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_emmet" .. PATHSEP .. "emmet-language-server" .. PATHSEP .. "dist" .. PATHSEP .. "index.js"
local node = require "libraries.nodejs"

lsp.add_server(common.merge({
  name = "emmet-ls",
  language = "jsx/tsx/html/xml/css/scss",
  file_patterns = {
    "%.jsx$", "%.tsx$", "%.html?$", "%.xml$", "%.scss$", "%.css$", "%.astro$"
  },
  command = { node.path_bin, installed_path, "--stdio" },
  verbose = false
}, config.plugins.lsp_emmet or {}))
