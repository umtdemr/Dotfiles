local catppuccin = require("catppuccin")
catppuccin.setup({
  transparent_background = true,
})

vim.cmd [[
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
