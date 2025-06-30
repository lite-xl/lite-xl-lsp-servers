-- mod-version:4

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_go" .. PATHSEP .. "gopls" .. (PLATFORM == "Windows" and ".exe" or "")
local golang = require "libraries.golang"

lspconfig.gopls.setup(common.merge({
  command = { installed_path },
  env = {
    ["PATH"] = golang.path_bindir
  },
}, config.plugins.lsp_go or {}))
