local info = {}

info.version = "haxe-4.3.6"
info.path_lib = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "haxe"
info.haxe_dir = "haxe_20240807093059_760c0dd"
info.path_bin = info.path_lib .. PATHSEP .. info.haxe_dir .. PATHSEP .. "haxe" .. (PLATFORM == "Windows" and ".exe" or "")

return info
