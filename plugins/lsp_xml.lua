-- mod-version:3

local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_xml"
local jdk_info = require "libraries.jdk"

local lemminx_path = { installed_path_plugin .. PATHSEP .. "org.eclipse.lemminx-uber.jar" }
local lemminx_command = { jdk_info.path_bin,
                          "-noverify",
                          "-Xms1G",
                          string.format("-jar %s", lemminx_path) }

lsp.add_server(common.merge({
  command = lemminx_command,
  env = { ["JAVA_HOME"] = jdk_info.path_lib },
}, config.plugins.lsp_xml or {}))
