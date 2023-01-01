-- mod-version:3 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp-lua"

lspconfig.sumneko_lua.setup common.merge({
  command = {
    installed_path .. "/bin/lua-language-server",
    "-E",
    installed_path .. "/bin/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = false
      }
    }
  }
}, config.plugins["lsp-lua"] or {})
