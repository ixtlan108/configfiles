local wez = require("wezterm")
local conf = wez.config_builder()
-- local sess = require("sessionizer")
-- conf.color_scheme = 'Ashes (light) (terminal.sexy)'
--conf.color_scheme = 'Atelier Cave Light (base16)'
--conf.color_scheme = 'Atelier Estuary Light (base16)'
--conf.color_scheme = 'Atelier Forest Light (base16)'
-- conf.color_scheme = 'Atelier Heath Light (base16)'
-- conf.color_scheme = "Atelier Plateau Light (base16)"

--local focus_color = "Atelier Plateau Light (base16)"
--local focus_color = "nordfox"
--local focus_color = "dayfox"
--local focus_color = "Atelier Cave Light (base16)"

--local un_focus_color = "Atelier Forest Light (base16)"
--local un_focus_color = "nightfox"
--local un_focus_color = "dayfox"
--local un_focus_color = "Atelier Estuary Light (base16)"

local is_light = false

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
conf.window_background_opacity = 0.9
conf.keys = {
	{
		key = "=",
		mods = "CTRL|SHIFT|ALT",
		action = wez.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "CTRL|SHIFT|ALT",
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
	{
		key = "w",
		mods = "LEADER",
		action = wez.action.ShowTabNavigator,
	},
	-- {
	-- 	key = "f",
	-- 	mods = "LEADER",
	-- 	action = wez.action_callback(sess.toggle),
	-- },
}
wez.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if is_light == true then
		overrides.color_scheme = "dayfox"
	else
		overrides.color_scheme = "nordfox"
	end
	-- if window:is_focused() then
	-- 	end
	-- else
	-- end
	window:set_config_overrides(overrides)
	return {}
end)
return conf
