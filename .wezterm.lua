-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Solarized Dark Higher Contrast (Gogh)'

config.font_size = 14.5

config.font =
    --wezterm.font("InputCdm Mono", {weight="Regular"})
    --wezterm.font("Hack")
    --wezterm.font("mononoki")
    wezterm.font("Noto Sans Mono")

config.colors = {
  -- The default text color
  foreground = '#c4e1df',
  -- The default background color
  background = '#05181c',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  --cursor_bg = '',
  -- Overrides the text color when the current cell is occupied by the cursor
  --cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  --cursor_border = '#52ad70',

  -- the foreground color of selected text
  selection_fg = '#eee8d5',
  -- the background color of selected text
  selection_bg = '#032931',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#013640',

  ansi = {
    '#03274f';
    '#d74d50';
    '#36bdbc';
    '#879aa1';
    '#d4b869';
    '#cb663c';
    '#e5634f';
    '#eee8d5';
  },
  brights = {
    '#002b36';
    '#39a4de';
    '#586e75';
    '#d9813d';
    '#839496';
    '#45be9b';
    '#60b0d6';
    '#fdf6e3';
  },

  -- Arbitrary colors of the palette in the range from 16 to 255
  indexed = { [136] = '#af8700' },

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = 'orange',

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  copy_mode_active_highlight_bg = { Color = '#000000' },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  -- quick_select_label_bg = { Color = 'peru' },
  -- quick_select_label_fg = { Color = '#ffffff' },
  -- quick_select_match_bg = { AnsiColor = 'Navy' },
  -- quick_select_match_fg = { Color = '#ffffff' },

}

config.hide_tab_bar_if_only_one_tab = true;

config.audible_bell = "Disabled"

-- and finally, return the configuration to wezterm
return config
