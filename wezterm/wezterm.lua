local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
wezterm.on("window-config-reloaded", function(window, pane)
  wezterm.log_info("teh config was reloaded for this window!")
end)

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.font = wezterm.font({
  family = "Hack Nerd Font",
})
config.font_size = 10.5

config.window_background_opacity = 0.97
wezterm.on("toggle-opacity", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.7
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

config.keys = {
  {
    key = "B",
    mods = "CTRL",
    action = wezterm.action.EmitEvent("toggle-opacity"),
  },
}

return config
