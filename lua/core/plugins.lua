-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
		-- lazy.nvim
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				-- add any options here
			},
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
				}
		},
		{"nvim-tree/nvim-tree.lua"},
		{"nvim-tree/nvim-web-devicons"},
		{"nvim-treesitter/nvim-treesitter"},
		{"neovim/nvim-lspconfig"},
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
				dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{ "rebelot/kanagawa.nvim" },
		{"williamboman/mason.nvim"},
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
	},
	{"hrsh7th/nvim-cmp"},
	{'hrsh7th/cmp-nvim-lsp'},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-cmdline"},
	{"hrsh7th/nvim-cmp"},
	{"jose-elias-alvarez/null-ls.nvim"},
	{"hedyhli/outline.nvim"},
	{"akinsho/toggleterm.nvim"},
	{"folke/which-key.nvim"},
	{"nvim-lualine/lualine.nvim"},
	{"akinsho/bufferline.nvim"},
	{"windwp/nvim-ts-autotag"},
	{"nvim-lua/plenary.nvim"},
	{"windwp/nvim-autopairs"},
	{"terrortylor/nvim-comment"},
	{"nvimdev/dashboard-nvim"},

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})