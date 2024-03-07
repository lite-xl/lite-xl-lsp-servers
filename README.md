# Lite-XL LSP Servers

A simple repo that contains plugins which automatically set up LSP servers with `lpm` or another
lite-xl package manager.

LSP servers can still be setup manually; this just serves to make it really easy to install, use
and depend on particular LSP servers functioning.

## Quickstart

```
lpm add https://github.com/adamharrison/lite-xl-lsp-servers.git && lpm install <LSP Plugin>
```

## Languages Supported

The following languages are supported, bundled with their particular language server.

| Plugin                                                       | Language(s)                    | Server                                                                                                 | Platforms
| :----------------------------------------------------------- | :----------------------------- | :----------------------------------------------------------------------------------------------------- | :------------------
| [lsp_c](/plugins/lsp_c.lua?raw=1)                            | C, C++, Objective-C            | [clangd](https://github.com/clangd/clangd)                                                             | Linux, Mac, Windows
| [lsp_emmet](/plugins/lsp_emmet.lua?raw=1)                    | JSX, TSX, HTML, XML, CSS, SCSS | [emmet-language-server](https://github.com/olrtg/emmet-language-server)                                | Linux, Mac, Windows
| [lsp_java](/plugins/lsp_java.lua?raw=1)                      | Java                           | [jdtls](https://github.com/eclipse-jdtls/eclipse.jdt.ls)                                               | Linux, Mac, Windows
| [lsp_lua](/plugins/lsp_lua.lua?raw=1)                        | Lua                            | [sumneko_lua](https://github.com/sumneko/lua-language-server)                                          | Linux, Mac, Windows
| [lsp_python](/plugins/lsp_python.lua?raw=1)                  | Python                         | [pyright](https://github.com/Microsoft/pyright)                                                        | Linux, Mac, Windows
| [lsp_quicklintjs](/plugins/lsp_quicklintjs.lua?raw=1)        | Javascript                     | [quick-lint-js](https://quick-lint-js.com/)                                                            | Linux, Mac, Windows
| [lsp_rust](/plugins/lsp_rust.lua?raw=1)                      | Rust                           | [rust-analyzer](https://github.com/rust-lang/rust-analyzer)                                            | Linux, Mac, Windows
| [lsp_tex](/plugins/lsp_tex.lua?raw=1)                        | TeX                            | [texlab](https://github.com/latex-lsp/texlab)                                                          | Linux, Mac, Windows
| [lsp_typescript](/plugins/lsp_typescript.lua?raw=1)          | Javascript, Typescript         | [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) | Linux, Mac, Windows
| [lsp_zig](/plugins/lsp_zig.lua?raw=1)                        | Zig                            | [zls](https://github.com/zigtools/zls)                                                                 | Linux, Mac, Windows

## Additional libraries

These libraries are dependencies of some language servers (automatic installation with `lpm`).

| Library                                                      | Description                                 | Platforms
| :----------------------------------------------------------- | :------------------------------------------ | :------------------
| [jdk](/libraries/jdk.lua?raw=1)                              | JDK binaries for running java apps          | Linux, Mac, Windows
| [nodejs](/libraries/nodejs.lua?raw=1)                        | NodeJs binaries for running javascript apps | Linux, Mac, Windows
