-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.check_for_updates = true

---------------------------------------------- KEYMAPS ---------------------------------------------
config.keys = {
  {
    key = '\\',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

-------------------------------------------- TEXT CONFIG -------------------------------------------
config.font_size = 15.5

config.bold_brightens_ansi_colors = "BrightOnly"

config.font =
    --wezterm.font('Input', { weight = 'Regular' })
    --wezterm.font('Hack', { weight = 'Regular' })
    --wezterm.font('mononoki', { weight = 'Regular' })
    --wezterm.font('Noto Sans Mono', { weight = 'Regular' })
    wezterm.font('Source Code Pro', { weight = 'Regular' })

---------------------------------------- CUSTOM COLORSCHEME ----------------------------------------
config.color_scheme = 'Ayu Dark (Gogh)'

config.colors = {
  -- The default text color
  foreground = '#dedfd8',
  -- The default background color
  background = '#0e141a',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#dedfd8',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = '#0e141a',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#dedfd8',

  -- the foreground color of selected text
  selection_fg = '#eee8d5',
  -- the background color of selected text
  selection_bg = '#33415E',

  -- The color of the scrollbar 'thumb'; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#232834',

  ansi = {
    '#191E2A';
    '#F07178';
    '#BAE67E';
    '#FFB454';
    '#59C2FF';
    '#CB9FF8';
    '#39BAE6';
    '#eee8d5';
  },
  brights = {
    '#404755';
    '#F28779';
    '#95E6CB';
    '#FFD580';
    '#73D0FF';
    '#D4BFFF';
    '#5CCFE6';
    '#fdf6e3';
  },

  -- -- Arbitrary colors of the palette in the range from 16 to 255
  -- indexed = { [136] = '#af8700' },

  -- -- Since: 20220319-142410-0fcdea07
  -- -- When the IME, a dead key or a leader key are being processed and are effectively
  -- -- holding input pending the result of input composition, change the cursor
  -- -- to this color to give a visual cue about the compose state.
  -- compose_cursor = 'orange',

  -- -- Colors for copy_mode and quick_select
  -- -- available since: 20220807-113146-c2fee766
  -- -- In copy_mode, the color of the active text is:
  -- -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- -- 2. selection_* otherwise
  -- copy_mode_active_highlight_bg = { Color = '#000000' },
  -- -- use `AnsiColor` to specify one of the ansi color palette values
  -- -- (index 0-15) using one of the names 'Black', 'Maroon', 'Green',
  -- --  'Olive', 'Navy', 'Purple', 'Teal', 'Silver', 'Grey', 'Red', 'Lime',
  -- -- 'Yellow', 'Blue', 'Fuchsia', 'Aqua' or 'White'.
  -- copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  -- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  -- copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  -- -- quick_select_label_bg = { Color = 'peru' },
  -- -- quick_select_label_fg = { Color = '#ffffff' },
  -- -- quick_select_match_bg = { AnsiColor = 'Navy' },
  -- -- quick_select_match_fg = { Color = '#ffffff' },

}

------------------------------------ MISCELLANEOUS CUSTOMIZATION -------------------------------------
config.hide_tab_bar_if_only_one_tab = true;
config.audible_bell = 'Disabled'
config.window_decorations = 'RESIZE'
config.alternate_buffer_wheel_scroll_speed = 3
config.default_cursor_style = 'SteadyUnderline'
config.cursor_thickness = '200%'

-- and finally, return the configuration to wezterm
return config
