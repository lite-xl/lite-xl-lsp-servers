-- mod-version:3 -- lite-xl 2.1

local common = require "core.common"
local config = require "core.config"
local lspconfig = require "plugins.lsp.config"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_java"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "jdk"

local java_home
local java_command

if PLATFORM == "Windows" then
  java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2" .. PATHSEP .. "bin" .. PATHSEP .. "java.exe"
  if system.get_file_info(java_home) == nil then
    java_command = installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  else
    java_command = "JAVA_HOME=" .. java_home .. " " .. installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  end
elseif PLATFORM == "Mac OS X" then
  java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2.jdk" .. PATHSEP .. "Contents" .. PATHSEP .. "Home" .. PATHSEP .. "bin" .. PATHSEP .. "java"
  if system.get_file_info(java_home) == nil then
    java_command = installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  else
    java_command = "JAVA_HOME=" .. java_home .. " " .. installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  end
else
  -- GNU/Linux
  java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2"
  if system.get_file_info(java_home) == nil then
    java_command = { installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls" }
  else
    java_command = { "bash", "-c", string.format("JAVA_HOME=%s %s", java_home , installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls") }
  end
end

lspconfig.jdtls.setup(common.merge({
  command = java_command
}, config.plugins.lsp_java or {}))
