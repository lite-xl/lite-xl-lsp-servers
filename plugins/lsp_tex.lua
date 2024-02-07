-- mod-version:3 -- lite-xl 2.1

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_tex"

local texfile
if PLATFORM == "Windows" then
  texfile = "texlab.exe"
else
  texfile = "texlab"
end

lspconfig.texlab.setup(common.merge({
  command = { installed_path .. PATHSEP .. texfile }
}, config.plugins.lsp_tex or {}))
