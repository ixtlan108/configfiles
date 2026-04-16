local wez = require("wezterm")
local conf = wez.config_builder()
-- local sess = require("sessionizer")

local is_light = true

local padding = 10
conf.window_padding = {
	left = padding,
	top = padding,
	right = padding,
	bottom = padding,
}

conf.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}
conf.font = wez.font("Fira Code", { weight = "ExtraLight" })
conf.font_size = 13.0
conf.window_background_opacity = 1.0
conf.use_fancy_tab_bar = true
conf.tab_max_width = 32

local current_cursor_bg = function()
	if is_light == true then
		return "black"
	else
		return "white"
	end
end
conf.colors = {
	tab_bar = {
		active_tab = {
			fg_color = "#fbf4c8",
			bg_color = "#9873a4",
		},
		inactive_tab = {
			fg_color = "#fbf4c8",
			bg_color = "#122342",
		},
	},
	cursor_bg = current_cursor_bg(),
	--cursor_fg = "black",
}
-- Switch to the last active tab when I close a tab
conf.switch_to_last_active_tab_when_closing_tab = true
conf.keys = {
	{
		key = "-",
		mods = "LEADER",
		action = wez.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "LEADER",
		action = wez.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "f",
		mods = "ALT",
		action = wez.action.TogglePaneZoomState,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wez.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = ",",
		mods = "LEADER",
		action = wez.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wez.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- {
	-- 	key = "w",
	-- 	mods = "LEADER",
	-- 	action = wez.action.ShowTabNavigator,
	-- },
	{
		key = "0",
		mods = "ALT",
		action = wez.action.PaneSelect({ alphabet = "0987654321", mode = "SwapWithActive" }),
		--action = wez.action.PaneSelect({ alphabet = "098765432" }),
	},
	-- {
	-- 	key = "1",
	-- 	mods = "ALT",
	-- 	action = wez.action.ActivatePaneByIndex(0, { mode = "SwapWithActive" }),
	-- 	--action = wez.action.PaneSelect({ mode = "SwapWithActive" }),
	-- },
	-- {
	-- 	key = "f",
	-- 	mods = "LEADER",
	-- 	action = wez.action_callback(sess.toggle),
	-- },
}
wez.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if is_light == true then
		overrides.color_scheme = "Modus-Operandi"
	else
		overrides.color_scheme = "nordfox"
	end
	window:set_config_overrides(overrides)
	return {}
end)
return conf
