local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Priority
config.default_prog = { "pwsh", "-NoLogo" }
config.window_close_confirmation = "NeverPrompt"
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Performance
config.max_fps = 165
config.animation_fps = 165

-- Keybindings
config.keys = {
  -- Open WSL in a new tab
  {
    key = 'y',
    mods = 'CTRL|SHIFT',
    action = act.SpawnCommandInNewTab { args = { 'wsl', '--cd', '~' } },
  },
  -- Split panes
  { key = 'd', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = 's', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  -- Move between panes
  { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Left" },
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Right" },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Up" },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection "Down" },
  -- Close pane
  { key = 'q', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false } },
  -- Close tab without confirmation
  { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = false } },
}

-- Behavior
config.window_padding = {
  left = 22,
  right = 22,
  top = 22,
  bottom = 22,
}
config.hide_tab_bar_if_only_one_tab = true

-- Appearance
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font {
  family = 'JetBrainsMono Nerd Font',
  weight = 'Medium',
}
config.font_size = 13
config.default_cursor_style = 'BlinkingBar'
config.window_background_opacity = 0.4
config.win32_system_backdrop = 'Acrylic'
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'

return config