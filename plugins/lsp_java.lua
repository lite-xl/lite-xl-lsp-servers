-- mod-version:3 -- lite-xl 2.1

local core = require "core"
local lspconfig = require "plugins.lsp.config"
local common = require "core.common"
local config = require "core.config"

local installed_path_plugin = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_java"
local installed_path_library = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "jdk"

local java_home
local java_command

if PLATFORM == "Windows" then
  java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2" .. PATHSEP .. "bin" .. PATHSEP .. "java.exe"
  if system.get_file_info("C:\\Program Files\\Java\\jdk-21.0.2\\bin\\java.exe") == nil then -- The Windows path string also contains the escape characters
    java_command = "JAVA_HOME=" .. java_home .. " " .. installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  else
    java_command = installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  end
elseif PLATFORM == "Mac OS X" then
  java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2.jdk" .. PATHSEP .. "Contents" .. PATHSEP .. "Home" .. PATHSEP .. "bin" .. PATHSEP .. "java"
  if system.get_file_info("/Library/Java/JavaVirtualMachines/jdk-21.0.2.jdk/Contents/Home/bin/java") == nil then
    java_command = "JAVA_HOME=" .. java_home .. " " .. installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  else
    java_command = installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  end
else
  -- GNU/Linux
  java_home = installed_path_library .. PATHSEP .. "jdk-21.0.2" .. PATHSEP .. "bin" .. PATHSEP .. "java"
  if system.get_file_info("/usr/bin/java") == nil then
    java_command = "JAVA_HOME=" .. java_home .. " " .. installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  else
    core.log("It's using the system jdk.")
    java_command = installed_path_plugin .. PATHSEP .. "bin" .. PATHSEP .. "jdtls"
  end
end

lspconfig.jdtls.setup(common.merge({
  command = { java_command }
}, config.plugins.lsp_java or {}))
