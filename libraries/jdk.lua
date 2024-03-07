local info = {}

info.version = "jdk-21.0.2"
info.path_lib = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "jdk"
info.path_bin = info.path_lib .. PATHSEP .. "jdk-21.0.2" .. PATHSEP .. "bin" .. PATHSEP .. "java" .. (PLATFORM == "Windows" and ".exe" or "")

return info
