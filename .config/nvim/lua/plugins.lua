local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itsel
    
    -- colorsheme
    use ("folke/tokyonight.nvim")

    -- line under
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- autoclosing brackets
    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- everything for lsp
    use { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp-signature-help', 'ray-x/lsp_signature.nvim' }
    
    -- add tabs and icons for it
    use 'lewis6991/gitsigns.nvim'
    use { 'romgrk/barbar.nvim', requires = { 'nvim-tree/nvim-web-devicons' }}
    use 'nvim-tree/nvim-web-devicons'
    
    -- icons for completion
    use 'onsails/lspkind-nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- multiple lines editing
    use 'mg979/vim-visual-multi'
    
    -- lsp servers configuration
    use 'neovim/nvim-lspconfig'

    -- dependencies
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- search
    use 'nvim-telescope/telescope.nvim'

    -- python formatters
    use 'nvie/vim-flake8'
    use 'psf/black'

    -- js support and dependencies
    use 'othree/html5.vim'
    use 'yuezk/vim-js'
    use 'evanleck/vim-svelte'
    use 'HerringtonDarkholme/yats.vim'
    use 'maxmellon/vim-jsx-pretty'

    -- tags support
    use 'leafOfTree/vim-matchtag'
    use 'alvan/vim-closetag'

    -- multiple langs support
    use 'sheerun/vim-polyglot'

    -- search tools
    use 'ctrlpvim/ctrlp.vim'
    use 'rking/ag.vim'

    -- files linting
    use 'elzr/vim-json'
    use 'ekalinin/dockerfile.vim'
    use 'othree/yajs.vim'
    use 'chrisbra/csv.vim'

    -- improved wild menu and ui
    use 'gelguy/wilder.nvim'
    use 'stevearc/dressing.nvim'

    -- better find and scrollbar
    use {
        'kevinhwang91/nvim-hlslens',
        config = function()
            require('hlslens').setup()
        end
    }
    use 'petertriho/nvim-scrollbar'

    -- rename plugin
    use {
        'filipdutescu/renamer.nvim',
        config = function()
            require('renamer').setup()
        end
    }

    -- terraform support
    use 'hashivim/vim-terraform'

    -- haskell tools
    use 'mrcjkb/haskell-tools.nvim'
    use 'alx741/vim-hindent'

    -- better splits
    use 'mrjones2014/smart-splits.nvim'

    -- rust support
    use 'simrat39/rust-tools.nvim'

    -- cursor highlight
    use {
        'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end
    }

    -- lsp progress
    use { 
        'j-hui/fidget.nvim', 
        config = function()
            require'fidget'.setup {
                progress = {
                    display = {
                        render_limit = 5
                    }
                }
            }
        end
    }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
