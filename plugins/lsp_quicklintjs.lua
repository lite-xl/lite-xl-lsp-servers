-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_quicklintjs" .. PATHSEP .. "quick-lint-js" .. PATHSEP .. "bin"

local filename = "quick-lint-js" .. (PLATFORM == "Windows" and ".exe" or "")

lspconfig.quicklintjs.setup(common.merge({
  command = { installed_path .. PATHSEP .. filename, "--lsp-server" },
}, config.plugins.lsp_quicklintjs or {}))
