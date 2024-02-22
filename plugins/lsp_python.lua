-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"
local core = require "core"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_python"
local node_version = "node-v20.11.0"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "nodejs"

local server_path = installed_path_plugin .. PATHSEP .. "package" .. PATHSEP .. "langserver.index.js"

local node_path
if ARCH == "x86_64-linux" then
  node_path = installed_path_library .. PATHSEP .. node_version .. "-linux-x64" .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif ARCH == "x86_64-darwin" then
  node_path = installed_path_library .. PATHSEP .. node_version .. "-darwin-x64" .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif ARCH == "arm64-darwin" then
  node_path = installed_path_library .. PATHSEP .. node_version .. "-darwin-arm64" .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif ARCH == "x86_64-windows" then
  node_path = installed_path_library .. PATHSEP .. node_version .. "-win-x64" .. PATHSEP .. "node.exe"
end

local final_command
core.log(node_path)
if system.get_file_info(node_path) == nil then
  -- NodeJs not installed with lpm, then tries to use the system path variable.
  final_command = {"node", server_path, "--stdio"}
  core.log("[lsp_python]: nodejs library not found, trying to use the 'node' path variable.")
else
  -- NodeJs installed with lpm, runs it instead.
  final_command = {node_path, server_path, "--stdio"}
  core.log("[lsp_python]: nodejs library found, using it to launch Pyright.")
end


lspconfig.pyright.setup(common.merge(
  {command = final_command},
  config.plugins.lsp_python or {}))
