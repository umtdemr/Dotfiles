-- colorscheme

local gh = require('config.pack').gh

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add { gh 'nickkadutskyi/jb.nvim' }
vim.cmd.colorscheme 'jb'
