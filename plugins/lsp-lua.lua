-- mod-version:3 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lua-lsp"

lspconfig.sumneko_lua.setup {
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
}
