local info = {}

info.path_lib = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "jdk"
info.version = "jdk-21.0.2"
info.path_arch = {}
info.path_bin = info.path_lib .. PATHSEP .. info.version .. PATHSEP .. "bin" .. PATHSEP .. "java" .. (PLATFORM == "Windows" and ".exe" or "")

return info
