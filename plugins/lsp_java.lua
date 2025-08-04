-- mod-version:3

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

local jdtls_data_path = ".jdtls"
-- You can find this in /config_linux/config.ini, search for `:org.eclipse.equinox.launcher`, it's right next to it
local jdtls_version_name  = "1.7.0.v20250519-0528"
local jdtls_command = { jdk_info.path_bin,
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundles.defaultStartLevel=4",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product",
                        "-Dlog.level=ALL",
                        "-Xmx1G",
                        "--add-modules=ALL-SYSTEM",
                        "--add-opens", "java.base/java.util=ALL-UNNAMED",
                        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                        "-jar", string.format("%s" .. PATHSEP .. "plugins" .. PATHSEP .. "org.eclipse.equinox.launcher_%s.jar", installed_path_plugin, jdtls_version_name),
                        "-configuration", string.format("%s" .. PATHSEP .. "config_%s", installed_path_plugin, platform),
                        "-data", string.format("%s", jdtls_data_path) }

lsp.add_server(common.merge({
  name = "jdtls",
  language = "java",
  file_patterns = { "%.java$" },
  command = jdtls_command,
  env = { ["JAVA_HOME"] = jdk_info.path_lib },
  verbose = false
}, config.plugins.lsp_java or {}))
