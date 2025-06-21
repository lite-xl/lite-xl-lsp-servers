-- mod-version:3 -- lite-xl 2.1

local common = require "core.common"
local config = require "core.config"
local lsp = require "plugins.lsp"

local installed_path = USERDIR .. PATHSEP .. "plugins" .. PATHSEP .. "lsp_harper"

lsp.add_server(common.merge({
  name = "harper-ls",
  language = "",
  file_patterns = {
    -- C
    "%.c$",
    -- CMake
    "%.cmake$",
    PATHSEP .. "CMakeLists%.txt$",
    -- C++
    "%.h$", "%.inl$", "%.cpp$", "%.cc$", "%.C$", "%.cxx$",
    "%.c++$", "%.hh$", "%.H$", "%.hxx$", "%.hpp$", "%.h++$",
    "%.ino$", "%.cu$", "%.cuh$",
    -- C#
    "%.cs$",
    -- Dart
    "%.dart$",
    -- TODO: email
    -- TODO: git-commit/gitcommit
    -- Go
    "%.go$",
    -- Haskell
    "%.hs$",
    -- HTML
    "%.html?$",
    -- Java
    "%.java$",
    -- JS
    "%.js$", "%.json$", "%.cson$", "%.mjs$", "%.cjs$",
    -- TODO: javascriptreact
    -- TODO: literatehaskell/lhaskell
    -- Lua
    "%.lua$", "%.rockspec$",
    -- Markdown
    "%.md$", "%.markdown$",
    -- TODO: Nix
    -- PHP
    "%.php$", "%.phtml",
    -- Plain Text
    "$.txt%",
    -- Python
    "%.py$", "%.pyw$", "%.rpy$", "%.pyi$",
    -- Ruby
    "%.rb$", PATHSEP .. "%.gemspec$", PATHSEP .. "Gemfile$", PATHSEP .. "Gemfile%.lock$",
    -- Rust
    "%.rs$",
    -- Scala
    "%.sc$", "%.scala$",
    -- Shell
    "%.sh$", "%.bash$",
    PATHSEP .. "%.bashrc$", PATHSEP .. "%.bash_profile$", PATHSEP .. "%.profile$",
    "%.zsh$", "%.fish$",
    PATHSEP .. "APKBUILD$",
    -- Swift
    "%.swift$",
    -- TOML
    "%.toml$",
    -- TS
    "%.ts$",
    -- Typst
    "%.typ$",
    -- Kotlin
    "%.kt$"
  },
  command = { installed_path .. PATHSEP .. "harper-ls" .. (PLATFORM == "Windows" and ".exe" or ""), "--stdio" },
  verbose = false
}, config.plugins.lsp_harper or {}))
