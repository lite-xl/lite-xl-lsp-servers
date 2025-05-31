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

-- FIX: may have to do with some hardcoded env var path ?
lsp.add_server(common.merge({
  name = "lemminx",
  language = "xml",
  file_patterns = { "%.xml$" },
  command = lemminx_command,
  env = { ["JAVA_HOME"] = jdk_info.path_lib },
  verbose = true
}, config.plugins.lsp_xml or {}))
