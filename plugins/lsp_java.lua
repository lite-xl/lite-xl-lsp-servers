-- mod-version:3 -- lite-xl 2.1

local core = require "core"
local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_java"
local jdk_info = require "libraries.jdk"

local platform
if PLATFORM == "Windows" then
  platform = "win"
elseif PLATFORM == "Mac OS X" then
  platform = "mac"
else
  platform = "linux"
end

local java_home = jdk_info.path_lib .. PATHSEP .. jdk_info.version
local java_bin = jdk_info.path_bin

local jdtls_data_path = ".jdtls"
local jdtls_version_name  = "1.6.600.v20231106-1826"
local jdtls_command = { java_bin,
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundles.defaultStartLevel=4",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product",
                        "-Dlog.level=ALL",
                        "-Xmx1G",
                        "--add-modules=ALL-SYSTEM",
                        "--add-opens", "java.base/java.util=ALL-UNNAMED",
                        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                        "-jar", string.format("%s/plugins/org.eclipse.equinox.launcher_%s.jar", installed_path_plugin, jdtls_version_name),
                        "-configuration", string.format("%s/config_%s", installed_path_plugin, platform),
                        "-data", string.format("%s", jdtls_data_path) }

lsp.add_server(common.merge({
  name = "jdtls",
  language = "java",
  file_patterns = { "%.java$" },
  command = jdtls_command,
  env = { ["JAVA_HOME"] = java_home },
  verbose = false
}, config.plugins.lsp_java or {}))
