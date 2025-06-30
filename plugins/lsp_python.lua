-- mod-version:4

local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"
local core = require "core"


local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_python"
local server_path = installed_path_plugin .. PATHSEP .. "package" .. PATHSEP .. "langserver.index.js"


local ok, node_info = pcall(require, "libraries.nodejs")
local final_command

if ok then
  -- NodeJs installed with lpm, runs it.
  final_command = {node_info.path_bin, server_path, "--stdio"}
  core.log_quiet("[lsp_python]: nodejs library found, using it to launch Pyright.")
else
  -- NodeJs not installed with lpm, tries to use the system path variable.
  final_command = {"node", server_path, "--stdio"}
  core.log_quiet("[lsp_python]: nodejs library not found, trying to use the 'node' path variable.")
end


lspconfig.pyright.setup(common.merge(
  {command = final_command},
  config.plugins.lsp_python or {}))
