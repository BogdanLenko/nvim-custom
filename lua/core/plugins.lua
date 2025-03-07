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
			    -- lazy
					{
						"sontungexpt/sttusline",
						dependencies = {
								"nvim-tree/nvim-web-devicons",
						},
						event = { "BufEnter" },
						config = function(_, opts)
								require("sttusline").setup {
										-- statusline_color = "#000000",
										statusline_color = "StatusLine",
		
										-- | 1 | 2 | 3
										-- recommended: 3
										laststatus = 3,
										disabled = {
												filetypes = {
														-- "NvimTree",
														-- "lazy",
												},
												buftypes = {
														-- "terminal",
												},
										},
										components = {
												"mode",
												"filename",
												"git-branch",
												"git-diff",
												"%=",
												"diagnostics",
												"lsps-formatters",
												"copilot",
												"indent",
												"encoding",
												"pos-cursor",
												"pos-cursor-progress",
										},
								}
						end,
				},{
					{'romgrk/barbar.nvim',
						dependencies = {
							'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
							'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
						},
						init = function() vim.g.barbar_auto_setup = false end,
						opts = {
							-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
							-- animation = true,
							-- insert_at_start = true,
							-- …etc.
						},
						version = '^1.0.0', -- optional: only update when a new 1.x version is released
					},
				},
		{"williamboman/mason.nvim"},
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})