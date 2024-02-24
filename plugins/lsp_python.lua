-- mod-version:3

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"
local core = require "core"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_python"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "nodejs" .. PATHSEP

local server_path = installed_path_plugin .. PATHSEP .. "package" .. PATHSEP .. "langserver.index.js"


local ok, node_info = pcall(require, "libraries.nodejs")
local final_command

if ok then
  -- NodeJs installed with lpm, runs it instead.
  final_command = {installed_path_library .. node_info.path, server_path, "--stdio"}
  core.log("[lsp_python]: nodejs library found, using it to launch Pyright.")
else
  -- NodeJs not installed with lpm, then tries to use the system path variable.
  final_command = {"node", server_path, "--stdio"}
  core.log("[lsp_python]: nodejs library not found, trying to use the 'node' path variable.")
end


lspconfig.pyright.setup(common.merge(
  {command = final_command},
  config.plugins.lsp_python or {}))
