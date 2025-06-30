-- mod-version:4 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_lua"

lspconfig.sumneko_lua.setup(common.merge({
  command = {
    installed_path .. "/bin/lua-language-server" .. (PLATFORM == "Windows" and ".exe" or ""),
  }
}, config.plugins.lsp_lua or {}))
