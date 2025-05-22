local wez = require("wezterm")
local conf = wez.config_builder()
-- local sess = require("sessionizer")
-- conf.color_scheme = 'Ashes (light) (terminal.sexy)'
-- conf.color_scheme = 'Atelier Cave Light (base16)'
-- conf.color_scheme = 'Atelier Estuary Light (base16)'
-- conf.color_scheme = 'Atelier Forest Light (base16)'
-- conf.color_scheme = 'Atelier Heath Light (base16)'
-- conf.color_scheme = "Atelier Plateau Light (base16)"

-- local focus_color = "Atelier Plateau Light (base16)"
local focus_color = "nordfox"
-- local focus_color = "Atelier Cave Light (base16)"

-- local un_focus_color = "Atelier Forest Light (base16)"
local un_focus_color = "nightfox"
-- local un_focus_color = "Atelier Estuary Light (base16)"

conf.font_size = 12
conf.window_background_opacity = 0.8
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
	-- {
	-- 	key = "f",
	-- 	mods = "LEADER",
	-- 	action = wez.action_callback(sess.toggle),
	-- },
}
wez.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if window:is_focused() then
		overrides.color_scheme = focus_color
	else
		overrides.color_scheme = un_focus_color
	end
	window:set_config_overrides(overrides)
	return {}
end)
return conf
