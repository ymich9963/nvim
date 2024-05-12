# Plugins
Using,
    
- [lazy.nvim](https://github.com/folke/lazy.nvim.git): Plugin Manager
- [alpha-nvim](https://github.com/goolord/alpha-nvim.git): NeoVim Homepage
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs.git): Makes using brackets easier
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git): Tabs
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git): Git inside NeoVim 
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim.git): Indentation 
- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim.git): LSP Configuration
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim.git): Markdown Preview 
- [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim.git): Commenting
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git): Fuzzy file finding 
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git): Fancy TODO: comments 
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim.git): Colourscheme (customised)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git): Syntax Highlighting
- [mbbill/undotree](https://github.com/mbbill/undotree.git): Improved Undo
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim.git): Key Hints

## Structure
Using `lazy.vim` to create a modular structure in `/lua`,

- `plugins/` contains all the plugin `.lua` files and the `/unused` directory for unused plugins
- `manager.lua` to setup `lazy.vim`
- `remaps.lua` for key remappings
- `sets.lua` for general settings 

## Config Setup
- Execute in terminal (Windows Powershell): `git clone https://github.com/ymich9963/nvim-config $HOME\AppData\Local\nvim` 

## Plugin Setup
- Run `:Lazy sync` to make sure everything is working
- For `markdown-preview` execute, `cd $HOME\AppData\Local\nvim-data\lazy\markdown-preview.nvim\app\` and `npm install`








