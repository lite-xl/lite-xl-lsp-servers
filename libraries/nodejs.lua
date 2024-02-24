-- mod-version:3

local info = {}

info.version = "node-v20.11.1"


if     ARCH == "x86_64-linux" then
  info.path = info.version .. "-linux-x64"    .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif ARCH == "x86_64-darwin" then
  info.path = info.version .. "-darwin-x64"   .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif ARCH == "arm64-darwin" then
  info.path = info.version .. "-darwin-arm64" .. PATHSEP .. "bin" .. PATHSEP .. "node"
elseif ARCH == "x86_64-windows" then
  info.path = info.version .. "-win-x64"      .. PATHSEP .. "node.exe"
end



return info
