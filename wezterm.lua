local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 80
config.initial_rows = 24

config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

local now = os.date("*t", os.time())
local frac_hour = now.hour + (now.min / 60) + (now.sec / 3600)
if frac_hour >= 7 and frac_hour < 19 then
	config.color_scheme = "tokyonight_day"
else
	config.color_scheme = "tokyonight_night"
end

config.window_background_opacity = 0.8

return config
