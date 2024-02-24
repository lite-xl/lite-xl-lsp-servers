-- mod-version:3 -- lite-xl 2.1

local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_java"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "jdk"

local java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2"
local java_command

if PLATFORM == "Windows" then
  java_command = { installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls" }
else
  java_command = { installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls" }
end

lsp.add_server(common.merge({
  name = "jdtls",
  language = "java",
  file_patterns = { "%.java$" },
  command = java_command,
  env = { ["JAVA_HOME"] = java_home },
  verbose = false
}, config.plugins.lsp_java or {}))
