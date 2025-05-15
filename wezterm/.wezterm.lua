local wez = require("wezterm")
local conf = wez.config_builder()
-- conf.color_scheme = 'Ashes (light) (terminal.sexy)'
-- conf.color_scheme = 'Atelier Cave Light (base16)'
-- conf.color_scheme = 'Atelier Estuary Light (base16)'
-- conf.color_scheme = 'Atelier Forest Light (base16)'
-- conf.color_scheme = 'Atelier Heath Light (base16)'
conf.color_scheme = "Atelier Plateau Light (base16)"
conf.font_size = 14
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
}

return conf
