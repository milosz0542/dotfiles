-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup(
  {
    { "hrsh7th/cmp-nvim-lsp" }, 
    { import = "milosz.plugins" },
    { import = "milosz.plugins.lsp" }
  },
  {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    }
  }
)

-- require("config.lazy")

vim.cmd.colorscheme("catppuccin")

-- require("config.options")

