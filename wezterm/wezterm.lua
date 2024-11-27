local wezterm = require("wezterm")
local is_windows = wezterm.target_triple:find("windows")

local config = wezterm.config_builder()

config.automatically_reload_config = true
wezterm.on("window-config-reloaded", function(window, pane)
  wezterm.log_info("teh config was reloaded for this window!")
end)

if is_windows then
  config.default_prog = { "powershell.exe" }
end

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 3500
config.use_ime = true

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.font = wezterm.font({
  family = "Hack Nerd Font",
})
if is_windows then
  config.font_size = 10.5
else
  config.font_size = 12
end

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

config.leader = { key = "b", mods = "ALT", timeout_milliseconds = 2000, }
config.keys = {
  { key = "o", mods = "LEADER", action = wezterm.action.EmitEvent("toggle-opacity"), },
  { key = "t", mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = "w", mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },
  { key = "s", mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = "d", mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = "h", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = "l", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = "k", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = "j", mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
}

return config
