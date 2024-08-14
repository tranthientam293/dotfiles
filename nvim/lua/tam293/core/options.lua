local opt = vim.opt

-- Backspace
opt.backspace = "indent,eol,start"

-- Blinking cursor
opt.guicursor = {
  "n-v-c:block",                                  -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20",                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50",                                      -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250",        -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

-- Block comment
opt.formatoptions:append({ "r" })

-- File encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- File format
opt.fileformat = "unix"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Line cursor
opt.cursorline = true

-- Line wrap
opt.wrap = false

-- Mouse
opt.mouse = "a"

-- Paste
opt.paste = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Sign column
opt.signcolumn = "yes"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Swapfile
opt.swapfile = false

-- Scroll off
opt.scrolloff = 8

-- System clipboard
opt.clipboard:append("unnamedplus")

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Termguicolor
opt.termguicolors = true
opt.background = "dark"
