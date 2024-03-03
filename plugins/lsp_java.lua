-- mod-version:3 -- lite-xl 2.1

local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_java"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "jdk"

local platform
if PLATFORM == "Windows" then
  platform = "win"
elseif PLATFORM == "Mac OS X" then
  platform = "mac"
else
  platform = "linux"
end

local jdtls_data_path = system.absolute_path(".") .. PATHSEP .. ".jdtls"
system.mkdir(jdtls_data_path)
local version_name  = "1.6.600.v20231106-1826"
local jdtls_command = { "java", " ",
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1", " ",
                        "-Dosgi.bundles.defaultStartLevel=4", " ",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product", " ",
                        "-Dlog.level=ALL", " ",
                        "-Xmx1G", " ",
                        "--add-modules=ALL-SYSTEM", " ",
                        "--add-opens", "java.base/java.util=ALL-UNNAMED", " ",
                        "--add-opens", "java.base/java.lang=ALL-UNNAMED", " ",
                        "-jar", " ", string.format("./plugins/org.eclipse.equinox.launcher_%s.jar", version_name), " ",
                        "-configuration", " ", string.format("./config_%s", platform), " ",
                        "-data", " ", string.format("%s", jdtls_data_path) }

local java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2"

local core = require "core"
core.log_quiet("JDTLS command: " .. common.serialize(table.concat(jdtls_command)))

lsp.add_server(common.merge({
  name = "jdtls",
  language = "java",
  file_patterns = { "%.java$" },
  command = jdtls_command,
  env = { ["JAVA_HOME"] = java_home },
  verbose = false
}, config.plugins.lsp_java or {}))
