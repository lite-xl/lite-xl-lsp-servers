local info = {}

info.path_lib = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "nodejs"
info.version = "node-v22.18.0"

info.path_arch = {}
info.path_arch["x86_64-linux"]   = info.version .. "-linux-x64"
info.path_arch["x86_64-darwin"]  = info.version .. "-darwin-x64"
info.path_arch["aarch64-darwin"] = info.version .. "-darwin-arm64"
info.path_arch["x86_64-windows"] = info.version .. "-win-x64"

if PLATFORM == "Windows" then
  info.path_bin = info.path_lib .. PATHSEP .. info.path_arch[ARCH] .. PATHSEP .. "node.exe"
else
  info.path_bin = info.path_lib .. PATHSEP .. info.path_arch[ARCH] .. PATHSEP .. "bin" .. PATHSEP .. "node"
end


return info
