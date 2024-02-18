-- mod-version:3

local lsp = require "plugins.lsp"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_quicklintjs" .. PATHSEP .. "quick-lint-js" .. PATHSEP .. "bin"

local filename
if PLATFORM == "Windows" then
  filename = "quick-lint-js.exe"
else
  filename = "quick-lint-js"
end

lsp.add_server(common.merge({
  name = "quicklintjs",
  language = "javascript",
  file_patterns = { "%.js$", "%.mjs$", "%.cjs$" },
  command = { installed_path .. PATHSEP .. filename, "--lsp-server" },
  id_not_extension = true,
  verbose = false
}, config.plugins.lsp_quicklintjs or {}))
