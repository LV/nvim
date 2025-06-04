std = "lua54+luajit"        -- LuaJIT support for Neovim configs
globals = { "vim", "use" }  -- Known globals (avoid undefined warnings)
ignore = {
  "111",   -- "setting non-standard global"
  "112"    -- "mutating non-standard global"
}
