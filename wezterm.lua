local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

config.color_scheme = "Gruvbox Material (Gogh)"

config.window_background_opacity = 0.8

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

config.leader = { key = "Space", mods = "CTRL" }

config.keys = {}

local function keymap(key, mods, action, ...)
	table.insert(config.keys, { key = key, mods = mods, action = action(...) })
end

keymap("o", "LEADER", wezterm.action.SpawnTab, "CurrentPaneDomain")
keymap("n", "LEADER", wezterm.action.ActivateTabRelative, -1)
keymap("p", "LEADER", wezterm.action.ActivateTabRelative, 1)
for i = 0, 9 do
	keymap(tostring(i), "LEADER", wezterm.action.ActivateTab, i)
end
keymap("c", "LEADER", wezterm.action.CloseCurrentTab, { confirm = true })

keymap("s", "LEADER|CTRL", wezterm.action.SplitHorizontal, { domain = "CurrentPaneDomain" })
keymap("v", "LEADER|CTRL", wezterm.action.SplitVertical, { domain = "CurrentPaneDomain" })
keymap("q", "LEADER|CTRL", wezterm.action.CloseCurrentPane, { confirm = false })
keymap("LeftArrow", "LEADER", wezterm.action.ActivatePaneDirection, "Left")
keymap("DownArrow", "LEADER", wezterm.action.ActivatePaneDirection, "Down")
keymap("UpArrow", "LEADER", wezterm.action.ActivatePaneDirection, "Up")
keymap("RightArrow", "LEADER", wezterm.action.ActivatePaneDirection, "Right")

keymap("h", "LEADER|CTRL", wezterm.action.ActivatePaneDirection, "Left")
keymap("j", "LEADER|CTRL", wezterm.action.ActivatePaneDirection, "Down")
keymap("k", "LEADER|CTRL", wezterm.action.ActivatePaneDirection, "Up")
keymap("l", "LEADER|CTRL", wezterm.action.ActivatePaneDirection, "Right")

config.unix_domains = {
	{
		name = "unix",
	},
}

config.default_gui_startup_args = { "connect", "unix" }

config.ssh_domains = {
	{
		name = "ssh",
		remote_address = "172.16.2.11",
		username = "treyvon",
	},
}

return config
