--mod-version:3
local core = require "core"
local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_sql"

lsp.add_server(common.merge({
  name = "sqls",
  language = "sql",
  file_patterns = { "%.sql$" },
  command = { installed_path .. PATHSEP .. 'sqls' },
  verbose = false
}, config.plugins.lsp_sql or {}))
