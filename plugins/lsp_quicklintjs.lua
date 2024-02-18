-- mod-version:3

local lsp = require "plugins.lsp"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "quicklintjs" .. PATHSEP .. "bin"

local filename
if PLATFORM == "Windows" then
  filename = "quick-lint-js.exe"
else
  filename = "quick-lint-js"
end

lsp.add_server {
  name = "quicklintjs",
  language = "javascript",
  file_patterns = { "%.js$", "%.mjs$", "%.cjs$" },
  command = { installed_path .. PATHSEP .. filename, "--lsp-server" },
  id_not_extension = true,
  verbose = false
}
