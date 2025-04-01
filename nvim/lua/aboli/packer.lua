vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- My own plugin: Netria
    -- use({"mirhajian/netria"})
    use({"~/projects/netria"})

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

 
    -- Theme Plugins
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use({
    --   'rose-pine/neovim',
    --   as = 'rose-pine',
    --   config = function()
    -- 	  vim.cmd('colorscheme rose-pine')
    --   end
    --  })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')



    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'}
        }
    }

    -- AutoPairs
    -- use {"windwp/nvim-autopairs", event = "InsertEnter"}
    -- mv ~/.local/share/nvim/site/pack/packer/opt/nvim-autopairs ~/.local/share/nvim/site/pack/packer/start/

    -- LSP stuff
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})

    use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

    use("ms-jpq/coq-nvim", {branch = "coq"})
    use("ms-jpq/coq.artifacts", {branch = "artifacts"})

    use({'prichrd/netrw.nvim'})

    -- Markdown previewer
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  
    -- use {
    --  'VonHeikemen/lsp-zero.nvim',
    --  requires = {
    --    -- LSP Support
    --    {'neovim/nvim-lspconfig'},
    --    {'williamboman/mason.nvim'},
    --    {'williamboman/mason-lspconfig.nvim'},
    --
    --    -- Autocompletion
    --    {'hrsh7th/nvim-cmp'},
    --    {'hrsh7th/cmp-buffer'},
    --    {'hrsh7th/cmp-path'},
    --    {'saadparwaiz1/cmp_luasnip'},
    --    {'hrsh7th/cmp-nvim-lsp'},
    --    {'hrsh7th/cmp-nvim-lua'},
    --
    --    -- Snippets
    --    {'L3MON4D3/LuaSnip'},
    --    {'rafamadriz/friendly-snippets'},
    --   }
    -- }
end)
