-- setup lazy.nvim per gh

-- variables in lua are global by default, so local keeps the lazyvim installation out of the global namespace
-- vim.fn is the prefix required to invoke vimscript
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- creates path for lazy to install into (.. is concatenating the paths)
if not (vim.uv or vim.loop).fs_stat(lazypath) then -- checks if that path exists, and if it doesn't exist, run the code
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- rtp = runtime path, where nvim looks when it has a question, like "do i have syntax highlighting for c++ code?"
vim.opt.rtp:prepend(lazypath) 

require("lazy").setup({
    -- list of urls to different plugins we want to install
    {
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin-macchiato"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
                
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = {
                    -- Always
                    "c", 
                    "lua", 
                    "vim", 
                    "vimdoc",
                    "query",
                    -- mine
                    "comment",
                    "dockerfile",
                    "markdown",
                    "markdown_inline",
                    "python", 
                    "sql",
                    "yaml",
                },

                -- Automatically install missing parsers when entering buffer
                -- i.e. if you enter a file and it doesn't have the parser installed it will auto-install
                auto_install = true,

                highlight = {
                    enable = true,
                },

                -- incremental allows us to press a single key and neovim uses treesitter's syntax-tree to figure out what region it should select
                incremental_selection = {
                    enable = true,
                    keymaps = {
                      init_selection = "<Leader>ss", -- start selection 
                      node_incremental = "<Leader>si", -- selection increment
                      -- scope is a bit of code a variable can live in only for that scope (so a function is a scope)
                      scope_incremental = "<Leader>sc", -- scope
                      node_decremental = "<Leader>sd", -- selection decrement
                    },
                },
            })
        end,
    },
    {
    	"robitx/gp.nvim",
	    config = function()
		    require("gp").setup({
                
                openai_api_key = os.getenv("OPENAPI_KEY"),

            })
		end,
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        },
        opts = {
        workspaces = {
          {
            name = "some-new-beginnings",
            path = "~/Documents/some-new-beginnings",
          },
        },

        }, 
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }

    }
}) 



