local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup({
  transparent_background = false,
})

vim.cmd [[
try
  colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
