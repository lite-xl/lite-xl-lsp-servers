local info = {}

info.version = "haxe-4.3.6"
info.haxe_dir = "haxe_20250509143529_e0b355c"
info.path_lib = USERDIR .. PATHSEP .. "libraries" .. PATHSEP .. "haxe"
info.path_bin_haxe = info.path_lib .. PATHSEP .. info.haxe_dir .. PATHSEP .. "haxe" .. (PLATFORM == "Windows" and ".exe" or "")
info.path_bin_haxelib = info.path_lib .. PATHSEP .. info.haxe_dir .. PATHSEP .. "haxelib" .. (PLATFORM == "Windows" and ".exe" or "")

info.path_bin = info.path_bin_haxe -- Same as `path_bin_haxe`

return info
