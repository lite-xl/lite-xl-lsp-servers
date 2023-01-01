-- mod-version:3 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_c"

lspconfig.clangd.setup({
  command = { installed_path .. PATHSEP .. "clangd_15.0.6" .. PATHSEP .. "bin" .. PATHSEP .. "clangd" .. (PLATFORM == "Windows" and ".exe" or "") }
})
