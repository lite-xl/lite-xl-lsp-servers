-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_python"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "node"

local server_path = installed_path_plugin .. PATHSEP .. "package" .. PATHSEP .. "langserver.index.js"

local node_path
if PLATFORM == "Linux" or PLATFORM == "Mac OS X" then
  node_path = installed_path_library .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif PLATFORM == "Windows" then
  node_path = installed_path_library .. PATHSEP .. "node.exe"
end



lspconfig.pyright.setup(common.merge({
  command = {node_path, server_path, "--stdio"}},
  config.plugins.lsp_python or {}))
