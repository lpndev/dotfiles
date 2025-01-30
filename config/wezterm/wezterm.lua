local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Priority
config.default_prog = { "pwsh", "-NoLogo" }
config.window_close_confirmation = "NeverPrompt"
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Appearance
config.font = wezterm.font {
  family = 'JetBrainsMono Nerd Font',
  weight = 'Medium',
}
config.font_size = 13
config.default_cursor_style = 'BlinkingBar'
config.window_background_opacity = 0.6
config.win32_system_backdrop = "Acrylic"
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.hide_tab_bar_if_only_one_tab = true

-- Behavior
config.window_padding = {
  left = 22,
  right = 22,
  top = 22,
  bottom = 22,
}

-- Performance
config.max_fps = 165
config.animation_fps = 165

-- Keybindings
config.keys = {
  { key = 'y', mods = 'CTRL|SHIFT', action = act.SpawnCommandInNewTab { args = { 'wsl', '--cd', '~' } } },
  { key = 'd', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = 's', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Left" },
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Right" },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Up" },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Down" },
  { key = 'q', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false } },
  { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = false } },
}

-- Colors
config.colors = {
  background = '#262626',
  foreground = '#d4d4d4',
  cursor_bg = '#d4d4d4',
  cursor_fg = '#262626',
  ansi = { '#262626', '#e06c75', '#98c379', '#e5c07b', '#61afef', '#c678dd', '#56b6c2', '#d4d4d4' },
  brights = { '#262626', '#e06c75', '#98c379', '#e5c07b', '#61afef', '#c678dd', '#56b6c2', '#d4d4d4' },
  cursor_border = '#d4d4d4',
  selection_bg = '#404040',
  selection_fg = '#d4d4d4',
  scrollbar_thumb = '#222222',
  split = '#404040',
}

return config
