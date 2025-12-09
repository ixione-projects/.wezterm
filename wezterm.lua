local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 80
config.initial_rows = 24

config.font = wezterm.font("JetBrains Mono")
config.font_size = 12
config.color_scheme = "tokyonight_night"

config.window_background_opacity = 0.8

return config
