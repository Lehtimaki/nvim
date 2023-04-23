vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  })

  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate',
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  })

  use('theprimeagen/harpoon')

  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- Theme
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    end,
  })

end)
