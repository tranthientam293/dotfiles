return {
  {
    'nvim-lua/plenary.nvim', -- lua functions that many plugins use
    'christoomey/vim-tmux-navigator', -- tmux & split window navigation
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({'*'})
    end
  }
}
