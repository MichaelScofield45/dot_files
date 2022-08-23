local wezterm = require 'wezterm'
return {
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'Symbols Nerd Font',
    }, 
    color_scheme = 'tokyonight',
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
}
