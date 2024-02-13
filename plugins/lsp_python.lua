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

local final_command
if system.get_file_info(node_path) == nil then
  -- NodeJs not installed with lpm, then tries to use the system path variable.
  final_command = {"node", server_path, "--stdio"}
else
  -- NodeJs installed with lpm, runs it instead.
  final_command = {node_path, server_path, "--stdio"}
end


lspconfig.pyright.setup(common.merge(
  {command = final_command},
  config.plugins.lsp_python or {}))
