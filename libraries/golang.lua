local info = {}

info.version = "go-1.24.5"
info.path_lib = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "golang" .. PATHSEP .. "go"
info.path_bindir = info.path_lib .. PATHSEP .. "bin"
info.path_bin = info.path_bindir .. PATHSEP .. "go" .. (PLATFORM == "Windows" and ".exe" or "")
info.path_bin_fmt = info.path_bindir .. PATHSEP .. "gofmt" .. (PLATFORM == "Windows" and ".exe" or "")

return info
