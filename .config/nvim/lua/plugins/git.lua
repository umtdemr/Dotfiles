-- gitsigns, diffview, telescope git pickers, lazygit

local gh = require('config.pack').gh

-- Here is a more advanced configuration example that passes options to `gitsigns.nvim`
--
-- See `:help gitsigns` to understand what each configuration key does.
-- Adds git related signs to the gutter, as well as utilities for managing changes
vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
local gitsigns = require 'gitsigns'
gitsigns.setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
  -- gitsigns.nvim's recommended keymaps:
  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange', buf = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange', buf = bufnr })

    -- Visual mode actions
    vim.keymap.set('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk', buf = bufnr })
    vim.keymap.set('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk', buf = bufnr })
    -- Normal mode actions
    vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk', buf = bufnr })
    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk', buf = bufnr })
    vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer', buf = bufnr })
    vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer', buf = bufnr })
    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk', buf = bufnr })
    vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline', buf = bufnr })
    vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'git [b]lame line', buf = bufnr })
    vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index', buf = bufnr })
    vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis '~' end, { desc = 'git [D]iff against last commit', buf = bufnr })
    vim.keymap.set('n', '<leader>hQ', function() gitsigns.setqflist 'all' end, { desc = 'git hunk [Q]uickfix list (all files in repo)', buf = bufnr })
    vim.keymap.set('n', '<leader>hq', gitsigns.setqflist, { desc = 'git hunk [q]uickfix list (all changes in this file)', buf = bufnr })
    -- Toggles
    vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line', buf = bufnr })
    vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle git intra-line [w]ord diff', buf = bufnr })
    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'text object [i]nside [h]unk', buf = bufnr })
  end,
}

-- [[ Diffview ]]
-- Review all changes (e.g. what an agent just did) file by file in a side-by-side diff.
--  :DiffviewOpen              working tree vs index
--  :DiffviewOpen main...HEAD  everything on this branch since it left main
--  :DiffviewFileHistory %     history of the current file
-- Inside the view: <tab>/<s-tab> next/prev file, `-` stage/unstage, `g?` help.
vim.pack.add { gh 'sindrets/diffview.nvim' }
require('diffview').setup {}

vim.keymap.set('n', '<leader>gd', function()
  if require('diffview.lib').get_current_view() then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end
end, { desc = '[G]it [D]iff view (toggle)' })
vim.keymap.set('n', '<leader>gf', '<Cmd>DiffviewFileHistory %<CR>', { desc = '[G]it [F]ile history' })
vim.keymap.set('n', '<leader>gl', '<Cmd>DiffviewFileHistory<CR>', { desc = '[G]it [L]og (repo history)' })

-- [[ Telescope git pickers ]]
vim.keymap.set('n', '<leader>gs', function() require('telescope.builtin').git_status() end, { desc = '[G]it [S]tatus (changed files)' })
vim.keymap.set('n', '<leader>gb', function() require('telescope.builtin').git_branches() end, { desc = '[G]it [B]ranches (switch)' })

-- [[ LazyGit ]]
-- Full git TUI (commit, push, rebase, stash...) in a floating window.
--  Requires the `lazygit` binary. Its config lives in ~/dotfiles/.config/lazygit/config.yml
--  (editPreset 'nvim-remote' makes `e` open files in this Neovim instead of a nested one).
vim.pack.add { gh 'kdheepak/lazygit.nvim' }
vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = '[G]it: Lazy[G]it' })
