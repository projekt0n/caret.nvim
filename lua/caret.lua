local M = {}

---@class CaretPalette
---`caret.nvim` color palette.
M.palette = {
  dark0 = '#2a2d25',
  dark1 = '#3f4536',
  dark2 = '#586048',
  dark3 = '#6d7859',

  light0 = '#cad8b1',
  light1 = '#c5d4ab',
  light2 = '#b0c48d',
  light3 = '#9db573',

  bright_red = '#f18e91',
  bright_green = '#a1ea9e',
  bright_yellow = '#e0c98a',
  bright_blue = '#80b7cb',
  bright_purple = '#baacd7',
  bright_aqua = '#67cfa3',
  bright_orange = '#e2a66f',

  neutral_red = '#a3332c',
  neutral_green = '#41a83f',
  neutral_yellow = '#d1a938',
  neutral_blue = '#358ea1',
  neutral_purple = '#bd73b7',
  neutral_aqua = '#13b470',
  neutral_orange = '#dd8925',

  faded_red = '#8d0a02',
  faded_green = '#327208',
  faded_yellow = '#ab7e00',
  faded_blue = '#305c66',
  faded_purple = '#71426d',
  faded_aqua = '#03844e',
  faded_orange = '#bf6c0a',

  black = '#030400',
  gray = '#75826f',
  white = '#fdfffa',
}

---This will return caret palette according to `vim.o.background`
---@rtype CaretColors
M.get_colors = function()
  local bg = vim.o.background

  ---@class CaretColors
  ---`caret.nvim` colors according vim background
  local base_colors = {
    bg0 = M.palette.dark0,
    bg1 = M.palette.dark1,
    bg2 = M.palette.dark2,
    bg3 = M.palette.dark3,
    fg0 = M.palette.light0,
    fg1 = M.palette.light1,
    fg2 = M.palette.light2,
    fg3 = M.palette.light3,
    red = M.palette.bright_red,
    green = M.palette.bright_green,
    yellow = M.palette.bright_yellow,
    blue = M.palette.bright_blue,
    purple = M.palette.bright_purple,
    aqua = M.palette.bright_aqua,
    orange = M.palette.bright_orange,
    black = M.palette.white,
    white = M.palette.black,
  }

  local light_colors = {
    bg0 = M.palette.light0,
    bg1 = M.palette.light1,
    bg2 = M.palette.light2,
    bg3 = M.palette.light3,
    fg0 = M.palette.dark0,
    fg1 = M.palette.dark1,
    fg2 = M.palette.dark2,
    fg3 = M.palette.dark3,
    red = M.palette.faded_red,
    green = M.palette.faded_green,
    yellow = M.palette.faded_yellow,
    blue = M.palette.faded_blue,
    purple = M.palette.faded_purple,
    aqua = M.palette.faded_aqua,
    orange = M.palette.faded_orange,
    black = M.palette.black,
    white = M.palette.white,
  }

  -- swap colors if light mode
  if bg == 'light' then
    base_colors = light_colors
  end

  base_colors.gray = M.palette.gray
  base_colors.none = 'NONE'

  return base_colors
end

---@class CaretConfig
---`caret.nvim` configurations
M.config = {
  options = {
    transparent = false,
    invert_signs = false,
    styles = {
      bold = true,
      italic = true,
      strikethrough = true,
      undercurl = true,
      underline = true,
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
  },
  mapping = {
    toggle_bg = nil,
  },
  groups = {},
}

---Neovim terminal mode colors `:h terminal-config`
---@param colors CaretColors
local set_terminal_colors = function(colors)
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.gray

  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = M.palette.neutral_red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = M.palette.neutral_green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = M.palette.neutral_yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = M.palette.neutral_blue

  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = M.palette.neutral_purple

  vim.g.terminal_color_6 = colors.aqua
  vim.g.terminal_color_14 = M.palette.neutral_aqua

  vim.g.terminal_color_7 = colors.fg1
  vim.g.terminal_color_15 = colors.white
end

---Define caret highlight groups in neovim.
local set_hlgroups = function()
  local c = M.get_colors()

  local cfg = M.config
  local opt = cfg.options
  local s = opt.styles

  set_terminal_colors(c)

  local groups = {
    -- Caret groups
    CaretFg0 = { fg = c.fg0 },
    CaretFg1 = { fg = c.fg1 },
    CaretFg2 = { fg = c.fg2 },
    CaretFg3 = { fg = c.fg3 },

    CaretBg0 = { fg = c.bg0 },
    CaretBg1 = { fg = c.bg1 },
    CaretBg2 = { fg = c.bg2 },
    CaretBg3 = { fg = c.bg3 },

    CaretGray = { fg = c.gray },
    CaretRed = { fg = c.red },
    CaretGreen = { fg = c.green },
    CaretYellow = { fg = c.yellow },
    CaretBlue = { fg = c.blue },
    CaretPurple = { fg = c.purple },
    CaretAqua = { fg = c.aqua },
    CaretOrange = { fg = c.orange },

    CaretGrayBold = { fg = c.gray, bold = s.bold },
    CaretRedBold = { fg = c.red, bold = s.bold },
    CaretGreenBold = { fg = c.green, bold = s.bold },
    CaretYellowBold = { fg = c.yellow, bold = s.bold },
    CaretBluebold = { fg = c.blue, bold = s.bold },
    CaretPurpleBold = { fg = c.purple, bold = s.bold },
    CaretAquaBold = { fg = c.aqua, bold = s.bold },
    CaretOrangeBold = { fg = c.orange, bold = s.bold },

    CaretRedSign = { fg = c.red, bg = c.bg1, reverse = opt.invert_signs },
    CaretGreenSign = { fg = c.green, bg = c.bg1, reverse = opt.invert_signs },
    CaretYellowSign = { fg = c.yellow, bg = c.bg1, reverse = opt.invert_signs },
    CaretBlueSign = { fg = c.blue, bg = c.bg1, reverse = opt.invert_signs },
    CaretPurpleSign = { fg = c.purple, bg = c.bg1, reverse = opt.invert_signs },
    CaretAquaSign = { fg = c.aqua, bg = c.bg1, reverse = opt.invert_signs },
    CaretOrangeSign = { fg = c.orange, bg = c.bg1, reverse = opt.invert_signs },

    CaretRedUnderline = { undercurl = s.undercurl, sp = c.red },
    CaretGreenUnderline = { undercurl = s.undercurl, sp = c.green },
    CaretYellowUnderline = { undercurl = s.undercurl, sp = c.yellow },
    CaretBlueUnderline = { undercurl = s.undercurl, sp = c.blue },
    CaretPurpleUnderline = { undercurl = s.undercurl, sp = c.purple },
    CaretAquaUnderline = { undercurl = s.undercurl, sp = c.aqua },
    CaretOrangeUnderline = { undercurl = s.undercurl, sp = c.orange },

    -- Base groups
    Normal = { bg = opt.transparent and c.none or c.bg0, fg = c.fg0 }, -- normal text
    CursorLine = { bg = c.bg1 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn = { link = 'CursorLine' }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

    Comment = { fg = c.gray, italic = s.italic },
    LineNr = { fg = c.bg3 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { bg = c.bg1, fg = c.orange }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    Search = { bg = c.yellow, fg = c.bg1, reverse = opt.inverse.search },
    IncSearch = { bg = c.orange, fg = c.bg2, bold = s.bold, reverse = opt.inverse.search },

    NormalFloat = { bg = opt.transparent and c.none or c.bg1, fg = c.fg0 }, -- Normal text in floating windows.
    ColorColumn = { bg = c.bg1 }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.blue }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { reverse = true }, -- character under the cursor
    lCursor = { link = 'Cursor' }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { link = 'Cursor' }, -- like Cursor, but used when in IME mode |CursorIM|
    Directory = { link = 'CaretYellow' }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.bg1, fg = c.green }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.bg1, fg = c.orange }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.bg1, fg = c.red }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.bg1, fg = c.yellow }, -- diff mode: Changed text within a changed line |diff.txt|
    DiffAdded = { link = 'DiffAdd' },
    DiffChanged = { link = 'DiffChange' },
    DiffRemoved = { link = 'DiffDelete' },
    EndOfBuffer = { link = 'CaretBg2' }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor = { link = 'Cursor' }, -- cursor in a focused terminal
    -- TermCursorNC                       = {}, -- cursor in an unfocused terminal
    ErrorMsg = { bg = c.red, fg = c.bg0, bold = s.bold }, -- error messages on the command line
    VertSplit = { bg = opt.transparent and c.none or c.bg0, fg = c.bg3 }, -- the column separating vertically split windows
    Folded = { bg = c.bg1, fg = c.fg3, italic = s.italic }, -- line used for closed folds
    FoldColumn = { link = 'Folded' }, -- 'foldcolumn'
    SignColumn = { bg = c.bg1 }, -- column where |signs| are displayed
    Substitute = { bg = c.aqua, fg = c.bg1 }, -- |:substitute| replacement text highlighting
    NonText = { link = 'CaretBg2' }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC                           = {}, -- normal text in non-current windows
    Pmenu = { bg = c.bg2, fg = c.fg1 }, -- Popup menu: normal item.
    PmenuSel = { bg = c.yellow, fg = c.bg2, bold = s.bold }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.bg2 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.gray }, -- Popup menu: Thumb of the scrollbar.
    Question = { link = 'CaretOrangeBold' }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg0, bold = s.bold }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey = { link = 'CaretFg3' }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { link = 'CaretRedUnderline' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { link = 'CaretBlueUnderline' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { link = 'CaretAquaUnderline' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { link = 'CaretPurpleUnderline' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { bg = c.fg3, fg = c.bg1 }, -- status line of current window
    StatusLineNC = { bg = c.bg1, fg = c.gray }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    MatchParen = { bg = c.bg3, bold = s.bold, reverse = opt.inverse.match_paren }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { link = 'CaretYellowBold' }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea                            = {}, -- Area for messages and cmdline
    MsgSeparator = { link = 'StatusLine' }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { link = 'CaretYellowBold' }, -- |more-prompt|
    TabLine = { bg = c.bg1, fg = c.fg3 }, -- tab pages line, not active tab page label
    TabLineFill = { link = 'TabLine' }, -- tab pages line, where there are no labels
    TabLineSel = { bg = c.bg1, fg = c.yellow }, -- tab pages line, active tab page label
    Title = { link = 'CaretPurple' }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg2, reverse = opt.inverse.visual }, -- Visual mode selection
    VisualNOS = { link = 'Visual' }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { link = 'CaretRedBold' }, -- warning messages
    Whitespace = { link = 'CaretGray' }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.yellow, fg = c.bg1, bold = s.bold }, -- current match in 'wildmenu' completion

    -- Vim Docs
    helpCommand = { link = 'CaretRed' }, -- command in vim doc, e.g. `command`

    -- Checkhealth
    healthError = { fg = c.bg0, bg = c.red },
    healthSuccess = { fg = c.bg0, bg = c.green },
    healthWarning = { fg = c.bg0, bg = c.yellow },

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.
    Constant = { link = 'CaretPurple' }, -- (preferred) any constant
    String = { link = 'CaretYellow', italic = s.italic }, --   a string constant: "this is a string"
    -- Character                          = {}, --  a character constant: 'c', '\n'
    -- Number                             = {}, --   a number constant: 234, 0xff
    -- Boolean                            = {}, --  a boolean constant: TRUE, false
    -- Float                              = {}, --    a floating point constant: 2.3e10

    Identifier = { link = 'CaretBlue' }, -- (preferred) any variable name
    Function = { link = 'CaretOrangeBold' }, -- function name (also: methods for classes)

    Statement = { link = 'CaretRed' }, -- (preferred) any statement
    -- Conditional                        = {}, --  if, then, else, endif, switch, etc.
    -- Repeat                             = {}, --   for, do, while, etc.
    -- Label                              = {}, --    case, default, etc.
    Operator = { link = 'CaretRed', italic = s.italic }, -- "sizeof", "+", "*", etc.
    -- Keyword                            = {}, --  any other keyword
    -- Exception                          = {}, --  try, catch, throw

    PreProc = { link = 'CaretAqua' }, -- (preferred) generic Preprocessor
    -- Include                            = {}, --  preprocessor #include
    -- Define                             = {}, --  preprocessor #define
    -- Macro                              = {}, --  same as Define
    -- PreCondit                          = {}, --  preprocessor #if, #else, #endif, etc.

    Type = { link = 'CaretYellow' }, -- (preferred) int, long, char, etc.
    StorageClass = { link = 'CaretPurple' }, -- static, register, volatile, etc.
    Structure = { link = 'CaretAqua' }, --  struct, union, enum, etc.
    Typedef = { link = 'CaretYellow' }, --  A typedef

    Special = { link = 'CaretOrange' }, -- (preferred) any special symbol
    SpecialChar = { link = 'CaretRed' }, --  special character in a constant
    Tag = { link = 'CaretAquaBold' }, --    you can use CTRL-] on this
    Delimiter = { link = 'CaretFg2' }, --  character that needs attention
    -- SpecialComment                     = {}, -- special things inside a comment
    Debug = { link = 'CaretRed' }, --    debugging statements

    Underlined = { fg = c.blue, underline = s.underline }, -- (preferred) text that stands out, HTML links
    -- Bold                               = { gui = 'bold' },
    -- Italic                             = { gui = 'italic' },

    -- ("Ignore", below, may be invisible...)
    -- Ignore                       = {}, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { bg = c.red, fg = c.bg0, bold = s.bold }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg0, bold = s.bold }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    -- Diagnostic
    DiagnosticError = { link = 'CaretRed' },
    DiagnosticSignError = { link = 'CaretRedSign' },
    DiagnosticUnderlineError = { link = 'CaretRedUnderline' },
    DiagnosticWarn = { link = 'CaretYellow' },
    DiagnosticSignWarn = { link = 'CaretYellowSign' },
    DiagnosticUnderlineWarn = { link = 'CaretYellowUnderline' },
    DiagnosticInfo = { link = 'CaretBlue' },
    DiagnosticSignInfo = { link = 'CaretBlueSign' },
    DiagnosticUnderlineInfo = { link = 'CaretBlueUnderline' },
    DiagnosticHint = { link = 'CaretAqua' },
    DiagnosticSignHint = { link = 'CaretAquaSign' },
    DiagnosticUnderlineHint = { link = 'CaretAquaUnderline' },

    DiagnosticFloatingError = { link = 'CaretRed' },
    DiagnosticFloatingWarn = { link = 'CaretOrange' },
    DiagnosticFloatingInfo = { link = 'CaretBlue' },
    DiagnosticFloatingHint = { link = 'CaretAqua' },

    DiagnosticVirtualTextError = { link = 'CaretRed' },
    DiagnosticVirtualTextWarn = { link = 'CaretYellow' },
    DiagnosticVirtualTextInfo = { link = 'CaretBlue' },
    DiagnosticVirtualTextHint = { link = 'CaretAqua' },

    -- LspDiagnosticsError                = { }, -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsErrorSign            = { }, -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsErrorFloating        = { }, -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsWarning              = { }, -- used for "Warning" diagnostic virtual text
    -- LspDiagnosticsWarningSign          = { }, -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsWarningFloating      = { }, -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsInformation          = { }, -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsInformationSign      = { }, -- used for "Information" signs in sign column
    -- LspDiagnosticsInformationFloating  = { }, -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsHint                 = { }, -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsHintSign             = { }, -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsHintFloating         = { }, -- used for "Hint" diagnostic messages in the diagnostics float

    LspReferenceText = { bg = c.bg2 }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.bg2 }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.bg2 }, -- used for highlighting "write" references
    LspCodeLens = { link = 'CaretGray' },

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- @error -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- ["@error"]                         = {}, -- For syntax/parser errors.
    -- ["@punctuation.delimiter"]         = {}, -- For delimiters ie: `.`
    -- ["@punctuation.bracket"]           = {}, -- For brackets and parens.
    -- ["@punctuation.special"]           = {}, -- For special punctutation that does not fall in the catagories before.
    -- ["@constant"]                      = {}, -- For constants
    -- ["@constant.builtin"]              = {}, -- For constant that are built in the language: `nil` in Lua.
    -- ["@constant.macro"]                = {}, -- For constants that are defined by macros: `NULL` in C.
    -- ["@string"]                        = {}, -- For strings.
    -- ["@string.regex"]                  = {}, -- For regexes.
    -- ["@string.escape"]                 = {}, -- For escape characters within a string.
    -- ["@character"]                     = {}, -- For characters.
    -- ["@number"]                        = {}, -- For integers.
    -- ["@boolean"]                       = {}, -- For booleans.
    -- ["@float"]                         = {}, -- For floats.
    -- ["@function"]                      = {}, -- For function (calls and definitions).
    -- ["@function.builtin"]              = {}, -- For builtin functions: `table.insert` in Lua.
    -- ["@function.macro"]                = {}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- ["@parameter"]                     = {}, -- For parameters of a function.
    -- ["@parameter.reference"]           = {}, -- For references to parameters of a function.
    -- ["@method"]                        = {}, -- For method calls and definitions.
    -- ["@field"]                         = {}, -- For fields.
    -- ["@property"]                      = {}, -- Same as `@field`,accesing for struct members in C.
    -- ["@constructor"]                   = {}, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- ["@conditional"]                   = {}, -- For keywords related to conditionnals.
    -- ["@repeat"]                        = {}, -- For keywords related to loops.
    -- ["@label"]                         = {}, -- For labels: `label:` in C and `:label:` in Lua.
    -- ["@operator"]                      = {}, -- For any operator: `+`, but also `->` and `*` in C.
    -- ["@keyword"]                       = {}, -- For keywords that don't fall in previous categories.
    -- ["@keyword.function"]              = {}, -- For keywords used to define a fuction.
    -- ["@exception"]                     = {}, -- For exception related keywords.
    -- ["@type"]                          = {}, -- For types.
    -- ["@type.builtin"]                  = {}, -- For builtin types (you guessed it, right ?).
    -- ["@namespace"]                     = {}, -- For identifiers referring to modules and namespaces.
    -- ["@include"]                       = {}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- ["@annotation"]                    = {}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- ["@text"]                          = {}, -- For strings considered text in a markup language.
    ['@text.strong'] = { bold = s.bold }, -- For text to be represented with strong.
    ['@text.strike'] = { strikethrough = s.strikethrough }, -- For text to be represented with strikethrough.
    ['@text.emphasis'] = { italic = s.italic }, -- For text to be represented with emphasis.
    -- ["@text.underline"]                = {}, -- For text to be represented with an underline.
    -- ["@text.title"]                    = {}, -- Text that is part of a title.
    -- ["@text.literal"]                  = {}, -- Literal text.
    -- ["@text.uri"]                      = {}, -- Any URI like a link or email.
    ['@variable'] = { link = 'CaretFg1' }, -- Any variable name that does not have another highlight.
    -- ["@variable.builtin"]              = {}, -- Variable names that are defined by the languages, like `this` or `self`.

    -- telescope.nvim
    -- https://github.com/nvim-telescope/telescope.nvim
    TelescopeSelection = { link = 'CaretOrangeBold' },
    TelescopeSlectionCaret = { link = 'CaretRed' },
    TelescopeMultiSelection = { link = 'CaretGray' },
    TelescopeNormal = { link = 'CaretFg1' },
    TelescopeBorder = { link = 'TelescopeNormal' },
    TelescopePromptBorder = { link = 'TelescopeNormal' },
    TelescopeResultsBorder = { link = 'TelescopeNormal' },
    TelescopePreviewBorder = { link = 'TelescopeNormal' },
    TelescopeMatching = { link = 'CaretBlue' },
    TelescopePromptPrefix = { link = 'CaretRed' },
    TelescopePrompt = { link = 'TelescopeNormal' },

    -- gitsigns.nvim
    -- https://github.com/lewis6991/gitsigns.nvim
    GitSignsAdd = { link = 'CaretGreenSign' },
    GitSignsChange = { link = 'CaretYellowSign' },
    GitSignsDelete = { link = 'CaretRedSign' },
    GitSignsCurrentLineBlame = { link = 'NonText' },

    -- nvim-cmp
    -- https://github.com/hrsh7th/nvim-cmp
    CmpItemAbbr = { link = 'CaretFg1' },
    CmpItemAbbrDeprecated = { fg = c.fg1, strikethrough = s.strikethrough },
    CmpItemAbbrMatch = { fg = c.orange, bg = c.none, bold = s.bold },
    CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },
    CmpItemMenu = { fg = c.gray, italic = s.italic },
    CmpItemKind = { link = 'CaretYellow' },
    CmpItemKindClass = { link = 'CaretPurple' },
    CmpItemKindConstructor = { link = 'CaretPurple' },
    CmpItemKindField = { link = 'CaretAqua' },
    CmpItemKindFile = { link = 'CaretRed' },
    CmpItemKindFolder = { link = 'CaretRed' },
    CmpItemKindFunction = { link = 'CaretPurple' },
    CmpItemKindInterface = { link = 'CaretGreen' },
    CmpItemKindKeyword = { link = 'Keyword' },
    CmpItemKindMethod = { link = 'CaretPurple' },
    CmpItemKindSnippet = { link = 'CaretYellow' },
    CmpItemKindText = { link = 'CaretFg0' },
    CmpItemKindValue = { link = 'CaretYellow' },
    CmpItemKindVariable = { link = 'CaretBlue' },

    -- nvim-notify
    -- https://github.com/rcarriga/nvim-notify
    NotifyERRORBorder = { link = 'CaretRed' },
    NotifyWARNBorder = { link = 'CaretYellow' },
    NotifyINFOBorder = { link = 'CaretGreen' },
    NotifyDEBUGBorder = { link = 'CaretBlue' },
    NotifyTRACEBorder = { link = 'CaretPurple' },
    NotifyERRORIcon = { link = 'CaretRed' },
    NotifyWARNIcon = { link = 'CaretYellow' },
    NotifyINFOIcon = { link = 'CaretGreen' },
    NotifyDEBUGIcon = { link = 'CaretBlue' },
    NotifyTRACEIcon = { link = 'CaretPurple' },
    NotifyERRORTitle = { link = 'CaretRed' },
    NotifyWARNTitle = { link = 'CaretYellow' },
    NotifyINFOTitle = { link = 'CaretGreen' },
    NotifyDEBUGTitle = { link = 'CaretBlue' },
    NotifyTRACETitle = { link = 'CaretPurple' },

    -- nvim-tree.lua
    -- https://github.com/kyazdani42/nvim-tree.lua
    NvimTreeNormal = { bg = opt.transparent and c.none or c.bg1, fg = c.fg2 },
    NvimTreeOpenedFile = { fg = c.fg2, bold = s.bold },
    NvimTreeExecFile = { fg = c.green, bold = s.bold },
    NvimTreeSymlink = { fg = c.aqua, bold = s.bold },
    NvimTreeSpecialFile = { fg = c.orange, bold = s.bold },
    NvimTreeImageFile = { fg = c.blue },
    NvimTreeGitDeleted = { link = 'CaretRed' },
    NvimTreeGitDirty = { link = 'CaretRed' },
  }

  -- Overriding user highlight groups
  for group, hl in pairs(M.config.groups) do
    if groups[group] and not vim.tbl_isempty(hl) then
      groups[group].link = nil
    end
    groups[group] = vim.tbl_extend('force', groups[group] or {}, hl)
  end

  return groups
end

---Toggle `vim.o.background` value 'light' or 'dark'
local toggle_background = function()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end

--- Merges recursively two or more map-like tables.
---@param ... any Two or more map-like tables.
---@return table Merged table
M.deep_extend = function(...)
  local lhs = {}
  for _, rhs in ipairs({ ... }) do
    for k, v in pairs(rhs) do
      if type(lhs[k]) == 'table' and type(v) == 'table' then
        lhs[k] = M.deep_extend(lhs[k], v)
      else
        lhs[k] = v
      end
    end
  end

  return lhs
end

---Setup caret colorscheme.
---@param user_config CaretConfig? Custom configuration table
M.setup = function(user_config)
  if vim.version().minor < 7 then
    vim.notify_once('caret.nvim: you must use neovim 0.7 or higher')
    return
  end

  M.config = M.deep_extend(M.config, user_config or {})

  -- reset colors
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  vim.g.colors_name = 'caret'
  vim.o.termguicolors = true

  local groups = set_hlgroups()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  vim.cmd.colorscheme('caret')

  -- toggle background keybinding
  if M.config.mapping.toggle_bg ~= nil then
    vim.keymap.set('n', M.config.mapping.toggle_bg, function()
      toggle_background()
    end, { noremap = true, silent = true })
  end
end

return M
