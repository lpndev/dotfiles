local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Appearance
config.font = wezterm.font {
    family = 'JetBrainsMono Nerd Font',
    weight = 'Medium',
}
config.window_padding = {
    left = 22,
    right = 22,
    top = 22,
    bottom = 22,
}
config.font_size = 12
config.default_cursor_style = 'BlinkingBar'
config.window_background_opacity = 0.6

-- Behavior
config.animation_fps = 165
config.max_fps = 165
config.enable_wayland = false
config.hide_tab_bar_if_only_one_tab = true
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Colors
config.colors = {
    background = '#0a0a0a',
    foreground = '#d4d4d4',
    cursor_bg = '#d4d4d4',
    cursor_fg = '#262626',
    cursor_border = '#d4d4d4',
    selection_bg = '#404040',
    selection_fg = '#d4d4d4',
    scrollbar_thumb = '#222222',
    split = '#404040',
}

return config
