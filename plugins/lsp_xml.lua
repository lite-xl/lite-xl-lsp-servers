-- mod-version:3

local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local jdk = require "libraries.jdk"

local install_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_xml"
local jarfile = "org.eclipse.lsp4xml-0.3.0-uber" .. ".jar"
local cmd = {
  jdk.path_bin,
  "-noverify",
  "-Xms2G",
  "-jar",
  install_path .. PATHSEP .. jarfile
}

print(table.concat(cmd, "\n"))

lsp.add_server(common.merge({
  name = "lemminx",
  language = "xml",
  file_patterns = {
    "%.xml$"
  },
  command = cmd,
  verbose = false
}, config.plugins.lsp_xml or {}))
