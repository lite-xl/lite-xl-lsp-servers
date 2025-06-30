-- mod-version:4

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_zig"
local zlsfile = "zls"

if PLATFORM == "Windows" then
  zlsfile = "zls.exe"
end

lspconfig.zls.setup(common.merge({
  command = { installed_path .. PATHSEP .. zlsfile }
}, config.plugins.lsp_zls or {}))

