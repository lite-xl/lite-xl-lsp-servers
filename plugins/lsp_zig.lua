-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_zig"
local zlsfile
if PLATFORM == "Windows" then
  zlsfile = "zls-x86_64-windows" .. PATHSEP .. "bin" .. PATHSEP .. "zls.exe"
elseif PLATFORM == "Mac OS X" then
  if ARCH == "aarch64-darwin" then
    zlsfile = "zls-aarch64-macos" .. PATHSEP .. "bin" .. PATHSEP .. "zls"
  else
    zlsfile = "zls-x86_64-macos" .. PATHSEP .. "bin" .. PATHSEP .. "zls"
  end
else
  zlsfile = "zls-x86_64-linux" .. PATHSEP .. "bin" .. PATHSEP .. "zls"
end

lspconfig.zls.setup(common.merge({
  command = { installed_path .. PATHSEP .. zlsfile }
}, config.plugins.lsp_zls or {}))

