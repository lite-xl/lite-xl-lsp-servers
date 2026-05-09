-- mod-version:3
local core = require "core"
local lsp = require "plugins.lsp"
local common = require "core.common"
local config = require "core.config"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_glsl" .. PATHSEP .. "bin" .. PATHSEP .. "glsl_analyzer"

lsp.add_server(common.merge({
  name = "glsl_analyzer`",
  language = "glsl",
  file_patterns = {
    "%.glsl$",
    "%.vsh$",
    "%.fsh$"
  },
  command = { installed_path .. (PLATFORM == "Windows" and ".exe" or "") },
  verbose = false
}, config.plugins.lsp_glsl or {}))
