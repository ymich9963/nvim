# NeoVim Config
My nvim config that I use on my Windows machine.

## Plugins
Using,
    
- [lazy.nvim](https://github.com/folke/lazy.nvim.git): Plugin Manager
- [alpha-nvim](https://github.com/goolord/alpha-nvim.git): NeoVim Homepage
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs.git): Makes using brackets easier
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git): Git inside NeoVim 
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim.git): Indentation 
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): LSP Manager
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Bridge for Mason and NeoVim LSP
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): NeoVim LSP
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Completion Engine
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim.git): Markdown Preview 
- [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim.git): Commenting
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): Fuzzy file finding with grep, also installed some optional dependencies 
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
### Windows
- Install NeoVim.
- Execute in terminal (Windows Powershell): `git clone https://github.com/ymich9963/nvim-config $HOME\AppData\Local\nvim` 
- Powershell 7 (`pwsh.exe`) is used for the terminal of choice. Remove the line in `sets.lua` for systems with no `pwsh.exe`.

### Linux
- Install NeoVim using the AppImage to get the latest version.
- Execute in terminal: `git clone https://github.com/ymich9963/nvim-config ~/.config/nvim`. 

# Plugin Setup
- Run `:Lazy sync` to make sure everything is working
- For `markdown-preview` execute, `cd $HOME\AppData\Local\nvim-data\lazy\markdown-preview.nvim\app\` and `npm install`

## Comments
- Setting up the LSP required combining the example given in the Mason docs by executing `:h mason-lspconfig-automatic-server-setup` and the [setup](https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#setup) provided by `nvim-cmp`.





