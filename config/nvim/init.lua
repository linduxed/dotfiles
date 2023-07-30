require("before_load_plugin_settings")

-- Leader must be set before plugins are loaded, to ensure that the right
-- leader key is used when generating the mappings.
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local function table_concat(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

local lazy_setup = {
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.PaperColor_Theme_Options = {
                theme = {
                    ["default.dark"] = {
                        override = {
                            color00 = { "", "233" },
                            folded_bg = { "", "17" },
                            folded_fg = { "", "117" }
                        }
                    },
                    ["default.light"] = {
                        override = {
                            color00 = { "", "255" },
                            folded_bg = { "", "195" },
                            folded_fg = { "", "31" }
                        }
                    }
                }
            }
        end,
        config = function()
            vim.cmd("colorscheme PaperColor")
        end
    },
    {
        "linduxed/colemak.nvim",
        -- Set to not be lazy, because I find it mentally easier to have it
        -- guaranteed that this plugin is loaded; it's hard for me to reason
        -- about the custom mappings of other plugins (commonly to account for
        -- the colemak.nvim) if I'm not sure whether colemak.nvim will have
        -- been loaded.
        lazy = false,
        -- Priority set to some arbitrary high number. If some other plugin
        -- has mappings that conflict with those of colemak.nvim, that plugin
        -- will need to be set to `lazy = true` (haven't figured out another
        -- way) and set the priority to be _lower_ than that of this plugin, to
        -- ensure that the other plugin will apply its mappings _after_
        -- colemak.nvim (higher priority means earlier load).
        priority = 100,
        config = function()
            require("colemak").setup()
        end,
    },

    {
        "gaoDean/autolist.nvim",
        version = "~2.3",
        ft = {
            "markdown",
            "text",
        },
        config = function()
            local autolist = require("autolist")

            autolist.setup()
            autolist.create_mapping_hook("i", "<CR>", autolist.new)
            autolist.create_mapping_hook("i", "<C-T>", autolist.indent)
            autolist.create_mapping_hook("i", "<C-D>", autolist.indent)
            autolist.create_mapping_hook("n", "o", autolist.new)
            autolist.create_mapping_hook("n", "O", autolist.new_before)
            autolist.create_mapping_hook("n", ">>", autolist.indent)
            autolist.create_mapping_hook("n", "<<", autolist.indent)
            autolist.create_mapping_hook("n", "<Leader>blr", autolist.force_recalculate)
            autolist.create_mapping_hook("n", "<Leader>bli", autolist.invert_entry)
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup({
                toggler = {
                    line = '<leader>c<space>',
                    block = '<leader>cb',
                },
                -- LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    line = '<leader>c<space>',
                    block = '<leader>cb',
                },
                extra = {
                    above = '<leader>cO',
                    below = '<leader>co',
                    eol = '<leader>cT',
                },
                -- Enable keybindings
                mappings = {
                    -- Operator-pending mapping:
                    -- `<leader>cc`
                    -- `<leader>cb`
                    -- `<leader>c[count]{motion}`
                    -- `<leader>b[count]{motion}`
                    basic = true,
                    -- Extra mappings:
                    -- `<leader>cO`,
                    -- `<leader>co`,
                    -- `<leader>cT`
                    extra = false,
                },
            })
        end
    },
    "dyng/ctrlsf.vim",
    {
        "Raimondi/delimitMate",
        init = function()
            --  This is the default, but is included here for clarity:
            --  The coc.vim completion menu needs a <CR> mapping to work reliably.
            --  Therefore this should not be set to 1.
            vim.g.delimitMate_expand_cr = 0

            vim.g.delimitMate_expand_space = 1
            vim.g.delimitMate_jump_expansion = 1
        end,
    },
    {
        "wincent/ferret",
        -- This plugin is primarily added for the Quickfix listing
        -- enhancements. The other features are rarely used.

        init = function()
            vim.g.FerretMap = 0
            vim.g.FerretQFCommands = 0
        end
    },
    "Rawnly/gist.nvim",
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 80, -- width of the Zen window
                height = 0.95, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = false, -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    foldcolumn = "0", -- disable fold column
                    list = false, -- disable whitespace characters
                },
            },
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false,  -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                },
                twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false }, -- disables the tmux statusline
            },
        },
        keys = {
            { "<Leader>go", "<cmd>ZenMode<CR>", desc = "ZenMode" }
        }
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").load({
                paths = os.getenv("HOME") .. "/.config/nvim/snippets"
            })

            require("luasnip").config.set_config({
                -- Tells LuaSnip to remember to keep around the last snippet.
                -- One can jump back into it even if you move outside of the selection.
                history = false,
                -- This allows dynamic snippets to update as one types.
                update_events = "TextChanged,TextChangedI",
            })

            -- Copied from the LuaSnip documentation
            vim.cmd([[
            " press <tab> to expand or jump in a snippet. these can also be mapped
            " separately " via <plug>luasnip-expand-snippet and <plug>luasnip-jump-next.
            imap <silent><expr> <tab> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : '<tab>'

            " -1 for jumping backwards.
            inoremap <silent> <s-tab> <cmd>lua require'luasnip'.jump(-1)<cr>

            snoremap <silent> <tab> <cmd>lua require('luasnip').jump(1)<cr>
            snoremap <silent> <s-tab> <cmd>lua require('luasnip').jump(-1)<cr>

            " for changing choices in choicenodes (not strictly necessary for a basic setup).
            imap <silent><expr> <c-e> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-e>'
            smap <silent><expr> <c-e> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-e>'
            ]])

            vim.keymap.set("n", "<leader>rse", function()
                require("luasnip.loaders").edit_snippet_files()
            end)
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- Close Neo-tree if it is the last window left in the tab
            close_if_last_window = false,
            -- used when sorting files and directories in the tree
            sort_case_insensitive = false,
            window = {
                position = "left",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["<space>"] = {
                        "toggle_node",
                        -- disable `nowait` if you have existing combos
                        -- starting with this char that you want to use
                        nowait = true,
                    },
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    -- close preview or floating neo-tree window
                    ["<esc>"] = "cancel",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["l"] = "focus_preview",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    -- ["S"] = "split_with_window_picker",
                    -- ["s"] = "vsplit_with_window_picker",
                    ["t"] = "open_tabnew",
                    -- ["<cr>"] = "open_drop",
                    -- ["t"] = "open_tab_drop",
                    ["w"] = "open_with_window_picker",
                    -- enter preview mode, which shows the current node
                    -- without focusing
                    --["P"] = "toggle_preview",
                    ["C"] = "close_node",
                    -- ['C'] = 'close_all_subnodes',
                    ["z"] = "close_all_nodes",
                    --["Z"] = "expand_all_nodes",
                    ["a"] = {
                        -- this command supports BASH style brace expansion
                        -- ("x{a,b,c}" -> xa,xb,xc).
                        -- see `:h neo-tree-file-actions` for details.
                        "add",
                        -- some commands may take optional config options,
                        -- see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none" -- "none", "relative", "absolute"
                        }
                    },
                    -- also accepts the optional config.show_path option like
                    -- "add". this also supports BASH style brace expansion.
                    ["A"] = "add_directory",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    -- takes text input for destination, also accepts the
                    -- optional config.show_path option like "add":
                    ["c"] = "copy",
                    -- ["c"] = {
                    --  "copy",
                    --  config = {
                    --    show_path = "none" -- "none", "relative", "absolute"
                    --  }
                    --}
                    -- takes text input for destination, also accepts the
                    -- optional config.show_path option like "add".
                    ["m"] = "move",
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                }
            },
            nesting_rules = {},
            filesystem = {
                filtered_items = {
                    -- when true, they will just be displayed differently than
                    -- normal items
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_by_name = {
                        --"node_modules"
                    },
                    -- uses glob style patterns
                    hide_by_pattern = {
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    -- remains visible even if other settings would normally
                    -- hide it
                    always_show = {
                        --".gitignored",
                    },
                    -- remains hidden even if visible is toggled to true,
                    -- this overrides always_show
                    never_show = {
                        --".DS_Store",
                        --"thumbs.db"
                    },
                    -- uses glob style patterns
                    never_show_by_pattern = {
                        --".null-ls_*",
                    },
                },
            },
            buffers = {
                follow_current_file = {
                    -- netrw disabled, opening a directory opens within the
                    -- window like netrw would, regardless of window.position
                    enabled = true,
                    -- `false` closes auto expanded dirs, such as
                    -- with `:Neotree reveal`
                    leave_dirs_open = false,
                },
                -- when true, empty folders will be grouped together
                group_empty_dirs = true,
                show_unloaded = true,
                window = {
                    mappings = {
                        ["bd"] = "buffer_delete",
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                    }
                },
            },
            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["A"]  = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                    }
                }
            }
        }
    },
    "chrisbra/NrrwRgn",
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- null_ls.builtins.diagnostics.credo,
                    null_ls.builtins.diagnostics.zsh,
                    -- null_ls.builtins.formatting.erlfmt,
                    null_ls.builtins.formatting.fnlfmt,
                    null_ls.builtins.formatting.jq,
                }
            })
        end
    },
    {
        "kevinhwang91/nvim-hlslens",
        -- Set to not be lazy to predictably override the mappings of
        -- colemak.nvim, since the mappings for this plugin overlap for
        -- normal-mode `k` and `K`.
        lazy = false,
        -- Priority is set to be 1 less than colemak.nvim, to ensure that
        -- colemak.nvim gets loaded first, followed by this plugin, leading to
        -- `k` and `K` being overridden.
        priority = 99,
        config = function()
            require('hlslens').setup({
                calm_down = true,
            })
        end,
        keys = {
            { "k",  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
            { "K",  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
            { "*",  [[*<Cmd>lua require('hlslens').start()<CR>]] },
            { "#",  [[#<Cmd>lua require('hlslens').start()<CR>]] },
            { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]] },
            { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]] },
        }
    },
    "nvim-tree/nvim-web-devicons",
    "vim-scripts/scratch.vim",
    {
        "godlygeek/tabular",
        keys = {
            {
                "<Leader>ate",
                ":Tabularize / = /l0<CR>",
                mode = "v",
                desc = "Tabularize - Equals"
            },
            {
                "<Leader>ate",
                ":Tabularize / = /l0<CR>",
                mode = "n",
                desc = "Tabularize - Equals"
            },
            {
                "<Leader>atc",
                ":Tabularize /:\\zs/l0l1<CR>",
                mode = "v",
                desc = "Tabularize - Whitespace after colon"
            },
            {
                "<Leader>atc",
                ":Tabularize /:\\zs/l0l1<CR>",
                mode = "n",
                desc = "Tabularize - Whitespace after colon"
            },
        }
    },
    {
        "majutsushi/tagbar",
        init = function()
            vim.g.tagbar_type_elixir = {
                ctagstype = "elixir",
                kinds = {
                    "p:protocols",
                    "m:modules",
                    "e:exceptions",
                    "y:types",
                    "d:delegates",
                    "f:functions",
                    "c:callbacks",
                    "a:macros",
                    "t:tests",
                    "i:implementations",
                    "o:operators",
                    "r:records"
                },
                sro = ".",
                kind2scope = {
                    p = "protocol",
                    m = "module"
                },
                scope2kind = {
                    protocol = "p",
                    module = "m"
                },
                sort = 0
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && " ..
                    "cmake --build build --config Release && " ..
                    "cmake --install build --prefix build"
            },
            {
                "olimorris/persisted.nvim",
                config = function()
                    require("persisted").setup({
                        -- directory where session files are saved
                        save_dir = vim.fn.expand(
                            vim.fn.stdpath("data") .. "/sessions/"
                        ),
                        -- silent nvim message when sourcing session file
                        silent = false,
                        -- create session files based on the branch of the
                        -- git enabled repository
                        use_git_branch = true,
                        -- automatically load the session for the cwd on
                        -- Neovim startup
                        autoload = true,
                        -- change session file name to match current working
                        -- directory if it changes
                        follow_cwd = true,
                        -- table of dirs that the plugin will auto-save and
                        -- auto-load from
                        allowed_dirs = {
                            "~/.dotfiles",
                            "~/Documents/exercism",
                            "~/Documents/programming",
                            "~/Documents/studies",
                            "~/Documents/upstream_repos",
                            "~/Documents/work",
                            "~/Documents/writing",
                            "~/build",
                            "~/vimwiki",
                        },
                        -- table of dirs that are ignored when auto-saving
                        -- and auto-loading
                        ignored_dirs = nil,
                        -- options for the telescope extension
                        telescope = {
                            -- whether to reset prompt after session deleted
                            reset_prompt_after_deletion = true,
                        },
                    })
                end
            }
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        layout_strategy = "vertical",
                    },
                },
            })

            require("telescope").load_extension("undo")
            require('telescope').load_extension('fzf')
            require("telescope").load_extension("persisted")

            -- Misc. mappings
            vim.keymap.set("n",
                "<C-p>",
                function() require('telescope.builtin').find_files({ follow = true }) end,
                { desc = "Telescope - Files" }
            )
            vim.keymap.set("n",
                "<leader>fg",
                function() require('telescope.builtin').live_grep() end,
                { desc = "Telescope - Line, all files, exact grep" }
            )
            vim.keymap.set("n",
                "<leader>fr",
                function()
                    require('telescope.builtin').grep_string({
                        shorten_path = true,
                        word_match = "-w",
                        only_sort_text = true,
                        search = ''
                    })
                end,
                { desc = "Telescope - Line, all files, fuzzy" }
            )
            vim.keymap.set("n",
                "<leader>fh",
                function() require('telescope.builtin').help_tags() end,
                { desc = "Telescope - Help tags" }
            )
            vim.keymap.set("n",
                "<leader>fm",
                function() require('telescope.builtin').marks() end,
                { desc = "Telescope - Marks" }
            )
            vim.keymap.set("n",
                "<leader>fb",
                function() require('telescope.builtin').current_buffer_fuzzy_find() end,
                { desc = "Telescope - Line, current buffer, fuzzy" }
            )
            vim.keymap.set("n",
                "<leader>ft",
                function() require('telescope.builtin').treesitter() end,
                { desc = "Telescope - Treesitter" }
            )
            vim.keymap.set("n",
                "<leader>fap",
                function() require('telescope.builtin').builtin() end,
                { desc = "Telescope - List all pickers" }
            )
            vim.keymap.set("n",
                "<leader>fs",
                "<cmd>Telescope persisted<cr>",
                { desc = "Telescope - Sessions" }
            )
            vim.keymap.set("n",
                "<F6>",
                "<cmd>Telescope undo<cr>",
                { desc = "Telescope - Undo tree" }
            )

            -- LSP mappings
            vim.keymap.set("n",
                "<leader>alr",
                function() require('telescope.builtin').lsp_references() end,
                { desc = "Telescope - LSP - references" }
            )
            vim.keymap.set("n",
                "<leader>ali",
                function() require('telescope.builtin').lsp_implementations() end,
                { desc = "Telescope - LSP - Implementations" }
            )
        end,
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
        keys = {
            {
                "<Leader>ale",
                "<cmd>TroubleToggle<cr>",
                desc = "Diagnostics window (Trouble)"
            },
        },
    },
    "neovim/nvim-lspconfig",
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = true
    },
    "nvim-treesitter/playground",
    {
        "tpope/vim-abolish",
        -- Must be eagerly loaded, otherwise the Abolish definitions in the
        -- `abolish_save_file` are attempted to read without the plugin loaded,
        -- resulting in errors on startup.
        lazy = false,
        init = function()
            -- Turn of mappings, mostly to disable the Coerce functionality of
            -- the plugin.
            vim.g.abolish_no_mappings = 1
            vim.g.abolish_save_file =
            "/home/linduxed/.config/nvim/after/plugin/abolish.vim"
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            lazy = true
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "powerline_dark"
                }
            })
        end
    },
    "tpope/vim-capslock",
    {
        "chrisgrieser/nvim-genghis",
        -- dependencies = "stevearc/dressing.nvim"
    },
    {
        "tpope/vim-fugitive",
        dependencies = {
            "tpope/vim-rhubarb",
        },
        init = function()
            vim.g.fugitive_no_maps = 1
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
                numhl = false,              -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false,             -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false,          -- Toggle with `:Gitsigns toggle_word_diff`
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = ' <author>, <author_time:%Y-%m-%d> - <summary>',
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Text object
                    map({ 'o', 'x' }, 'rh', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end
    },
    {
        "plasticboy/vim-markdown",
        init = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_auto_insert_bullets = 0
            vim.g.vim_markdown_new_list_item_indent = 0
            vim.g.vim_markdown_no_default_key_mappings = 1
            vim.g.vim_markdown_conceal_code_blocks = 0
        end
    },
    {
        "inkarkat/vim-mark",
        dependencies = {
            "inkarkat/vim-ingo-library",
        },
        init = function()
            vim.g.mw_no_mappings = 1
            vim.g.mwDefaultHighlightingPalette = {
                { ctermbg = "Blue",        ctermfg = "Black" },
                { ctermbg = "Green",       ctermfg = "Black" },
                { ctermbg = "Yellow",      ctermfg = "Black" },
                { ctermbg = "DarkCyan",    ctermfg = "Black" },
                { ctermbg = "DarkBlue",    ctermfg = "Black" },
                { ctermbg = "DarkMagenta", ctermfg = "Black" },
                { ctermbg = "DarkRed",     ctermfg = "Black" },
                { ctermbg = "DarkGreen",   ctermfg = "Black" },
                { ctermbg = "Red",         ctermfg = "Black" },
                { ctermbg = "White",       ctermfg = "Gray" },
                { ctermbg = "LightGray",   ctermfg = "White" },
                { ctermbg = "Cyan",        ctermfg = "Black" },
                { ctermbg = "Brown",       ctermfg = "Black" }
            }
        end,
        keys = {
            {
                "<Leader>mm",
                "<Plug>MarkSet",
                desc = "Mark - Word under cursor"
            },
            {
                "<Leader>mm",
                "<Plug>MarkSet",
                mode = "x",
                desc = "Mark - Selected"
            },
            {
                "<Leader>mr",
                "<Plug>MarkRegex",
                desc = "Mark - Regex"
            },
            {
                "<Leader>mr",
                "<Plug>MarkRegex",
                mode = "x",
                desc = "Mark - Regex"
            },
            {
                "<Leader>mt",
                "<Plug>MarkToggle",
                desc = "Mark - Toggle all highlights"
            },
            {
                "<Leader>mx",
                "<Plug>MarkClear",
                desc = "Mark - Remove highlight under cursor"
            },
            {
                "<Leader>mc",
                "<Plug>MarkAllClear",
                desc = "Mark - Remove all highlights"
            },
            {
                "<Leader>m*",
                "<Plug>MarkSearchCurrentNext",
                desc = "Mark - Jump to next instance of current"
            },
            {
                "<Leader>m#",
                "<Plug>MarkSearchCurrentPrev",
                desc = "Mark - Jump to previous instance of current"
            },
            {
                "<Leader>m/",
                "<Plug>MarkSearchAnyNext",
                desc = "Mark - Jump to next highlight (any)"
            },
            {
                "<Leader>m?",
                "<Plug>MarkSearchAnyPrev",
                desc = "Mark - Jump to previous highlight (any)"
            },
        },
    },
    "tpope/vim-ragtag",
    {
        "mhinz/vim-sayonara",
        keys = {
            {
                "<leader>aqh",
                ":Sayonara<CR>",
                desc = "Sayonara - Hard (affects window layout)"
            },
            {
                "<leader>aqs",
                ":Sayonara!<CR>",
                desc = "Sayonara - Soft (retains window layout)"
            },
        },
    },
    "honza/vim-snippets",
    {
        "monaqa/dial.nvim",
        config = function()
            vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal())
            vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal())
            vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual())
            vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual())
            vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual())
            vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual())

            local augend = require("dial.augend")
            require("dial.config").augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.alias.bool,
                    augend.date.alias["%Y-%m-%d"],
                    augend.date.alias["%H:%M"],
                    augend.case.new {
                        types = {
                            "snake_case",
                            "PascalCase",
                            "SCREAMING_SNAKE_CASE",
                            "camelCase",
                            "kebab-case",
                        },
                        cyclic = true,
                    },
                    augend.semver.alias.semver,
                }
            }
        end
    },
    {
        "kylechui/nvim-surround",
        -- Use for stability; omit to use `main` branch for the latest features
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "cs",
                    normal_cur = "css",
                    normal_line = "cS",
                    normal_cur_line = "cSS",
                    visual = "s",
                    visual_line = "gs",
                    delete = "ds",
                    change = "ws",
                },
                aliases = {
                    ["a"] = ">",
                    ["b"] = ")",
                    ["B"] = "}",
                    ["r"] = "]",
                    ["q"] = { '"', "'", "`" },
                    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
                },
            })
        end
    },
    {
        "machakann/vim-swap",
        init = function()
            vim.g.swap_no_default_key_mappings = 1
        end,
        config = function()
            vim.keymap.set({ "n" }, "g<", "<Plug>(swap-prev)")
            vim.keymap.set({ "n" }, "g>", "<Plug>(swap-next)")
            vim.keymap.set({ "n", "x" }, "gm", "<Plug>(swap-interactive)")
        end
    },
    {
        "Tummetott/unimpaired.nvim",
        config = function()
            require('unimpaired').setup({
                -- Copying in entire default configuration to modify it.
                default_keymaps = false,
                keymaps = {
                    previous = {
                        mapping = '[a',
                        description = 'Jump to [count] previous file in arglist',
                        dot_repeat = false
                    },
                    next = {
                        mapping = ']a',
                        description = 'Jump to [count] next file in arglist',
                        dot_repeat = false,
                    },
                    first = {
                        mapping = '[A',
                        description = 'Jump to first file in arglist',
                        dot_repeat = false,
                    },
                    last = {
                        mapping = ']A',
                        description = 'Jump to last file in arglist',
                        dot_repeat = false,
                    },
                    bprevious = {
                        mapping = '[b',
                        description = 'Jump to [count] previous buffer',
                        dot_repeat = false,
                    },
                    bnext = {
                        mapping = ']b',
                        description = 'Jump to [count] next buffer',
                        dot_repeat = false,
                    },
                    bfirst = {
                        mapping = '[B',
                        description = 'Jump to first buffer',
                        dot_repeat = false,
                    },
                    blast = {
                        mapping = ']B',
                        description = 'Jump to last buffer',
                        dot_repeat = false,
                    },
                    lprevious = {
                        mapping = '[l',
                        description = 'Jump to [count] previous entry in loclist',
                        dot_repeat = false,
                    },
                    lnext = {
                        mapping = ']l',
                        description = 'Jump to [count] next entry in loclist',
                        dot_repeat = false,
                    },
                    lfirst = {
                        mapping = '[L',
                        description = 'Jump to first entry in loclist',
                        dot_repeat = false,
                    },
                    llast = {
                        mapping = ']L',
                        description = 'Jump to last entry in loclist',
                        dot_repeat = false,
                    },
                    lpfile = {
                        mapping = '[<C-l>',
                        description = 'Jump to last entry of [count] previous file in loclist',
                        dot_repeat = false,
                    },
                    lnfile = {
                        mapping = ']<C-l>',
                        description = 'Jump to first entry of [count] next file in loclist',
                        dot_repeat = false,
                    },
                    cprevious = {
                        mapping = '[q',
                        description = 'Jump to [count] previous entry in qflist',
                        dot_repeat = false,
                    },
                    cnext = {
                        mapping = ']q',
                        description = 'Jump to [count] next entry in qflist',
                        dot_repeat = false,
                    },
                    cfirst = {
                        mapping = '[Q',
                        description = 'Jump to first entry in qflist',
                        dot_repeat = false,
                    },
                    clast = {
                        mapping = ']Q',
                        description = 'Jump to last entry in qflist',
                        dot_repeat = false,
                    },
                    cpfile = {
                        mapping = '[<C-q>',
                        description = 'Jump to last entry of [count] previous file in qflist',
                        dot_repeat = false,
                    },
                    cnfile = {
                        mapping = ']<C-q>',
                        description = 'Jump to first entry of [count] next file in qflist',
                        dot_repeat = false,
                    },
                    tprevious = false,
                    tnext = false,
                    tfirst = false,
                    tlast = false,
                    ptprevious = false,
                    ptnext = false,
                    previous_file = false,
                    next_file = {
                        mapping = ']f',
                        description = 'Next file in directory. :cnewer in qflist',
                        dot_repeat = false,
                    },
                    blank_above = {
                        mapping = '[<Space>',
                        description = 'Add [count] blank lines above',
                        dot_repeat = true,
                    },
                    blank_below = {
                        mapping = ']<Space>',
                        description = 'Add [count] blank lines below',
                        dot_repeat = true,
                    },
                    exchange_above = {
                        mapping = '[e',
                        description = 'Exchange line with [count] lines above',
                        dot_repeat = true,
                    },
                    exchange_below = {
                        mapping = ']e',
                        description = 'Exchange line with [count] lines below',
                        dot_repeat = true,
                    },
                    exchange_section_above = {
                        mapping = '[e',
                        description = 'Move section [count] lines up',
                        dot_repeat = true,
                    },
                    exchange_section_below = {
                        mapping = ']e',
                        description = 'Move section [count] lines down',
                        dot_repeat = true,
                    },
                    enable_diff = false,
                    disable_diff = false,
                    toggle_diff = {
                        mapping = 'cod',
                        description = 'Toggle diff',
                        dot_repeat = false,
                    },
                    enable_hlsearch = false,
                    disable_hlsearch = false,
                    toggle_hlsearch = false,
                    enable_ignorecase = false,
                    disable_ignorecase = false,
                    toggle_ignorecase = false,
                    enable_list = false,
                    disable_list = false,
                    toggle_list = {
                        mapping = 'col',
                        description = 'Toggle invisible characters (listchars)',
                        dot_repeat = false,
                    },
                    enable_number = false,
                    disable_number = false,
                    toggle_number = {
                        mapping = 'con',
                        description = 'Toggle line numbers',
                        dot_repeat = false,
                    },
                    enable_relativenumber = false,
                    disable_relativenumber = false,
                    toggle_relativenumber = {
                        mapping = 'cor',
                        description = 'Toggle relative numbers',
                        dot_repeat = false,
                    },
                    enable_spell = false,
                    disable_spell = false,
                    toggle_spell = {
                        mapping = 'cos',
                        description = 'Toggle spell check',
                        dot_repeat = false,
                    },
                    enable_background = false,
                    disable_background = false,
                    toggle_background = {
                        mapping = 'cob',
                        description = 'Toggle background',
                        dot_repeat = false,
                    },
                    enable_cursorline = false,
                    disable_cursorline = false,
                    toggle_cursorline = false,
                    enable_cursorcolumn = false,
                    disable_cursorcolumn = false,
                    toggle_cursorcolumn = false,
                    enable_virtualedit = false,
                    disable_virtualedit = false,
                    toggle_virtualedit = {
                        mapping = 'cov',
                        description = 'Toggle virtualedit',
                        dot_repeat = false,
                    },
                    enable_wrap = false,
                    disable_wrap = false,
                    toggle_wrap = {
                        mapping = 'cow',
                        description = 'Toggle line wrapping',
                        dot_repeat = false,
                    },
                    enable_cursorcross = false,
                    disable_cursorcross = false,
                    toggle_cursorcross = {
                        mapping = 'cox',
                        description = 'Toggle cursorcross',
                        dot_repeat = false,
                    },
                },
            })
        end
    },
    "sheerun/vim-polyglot",
    {
        "liuchengxu/vista.vim",
        init = function()
            vim.g.vista_icon_indent = { "↳ ", "↦ " }
        end
    },
    {
        "reedes/vim-wheel",
        init = function()
            -- Disable for mouse, due to erratic behavior.
            vim.g["wheel#map#mouse"] = 0

            vim.g["wheel#map#up"]    = "U"
            vim.g["wheel#map#down"]  = "E"
        end
    },
    "guns/xterm-color-table.vim",
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    },
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup({
                -- Id is automatically added at the beginning, and name at the end
                -- See :help oil-columns
                columns = {
                    "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`
                default_file_explorer = true,
                -- Skip the confirmation popup for simple operations
                skip_confirm_for_simple_edits = false,
            })
        end
    },
    {
        'kiran94/edit-markdown-table.nvim',
        config = function()
            require('edit-markdown-table').setup()
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "EditMarkdownTable",
    },
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = { "BufReadPre " .. vim.fn.expand "~" .. "/vimwiki/**.md" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            dir = "~/vimwiki",
            notes_subdir = "notes",
            daily_notes = {
                folder = "diary",
            },
            completion = {
                nvim_cmp = true,
            },

            -- Disable frontmatter handling, since I don't fully understand all
            -- the things that the plugin does with the frontmatter.
            disable_frontmatter = true,

            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,

            -- Optional, alternatively you can customize the frontmatter data.
            note_frontmatter_func = function(note)
                -- This is equivalent to the default frontmatter function.
                local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,

            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },
            follow_url_func = function(url)
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end,
            -- Optional, set to true if you use the Obsidian Advanced URI plugin.
            use_advanced_uri = false,
            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,
        },
        config = function(_, opts)
            require("obsidian").setup(opts)

            vim.keymap.set("n", "gf", function()
                if require("obsidian").util.cursor_on_markdown_link() then
                    return "<cmd>ObsidianFollowLink<CR>"
                else
                    return "gf"
                end
            end, { noremap = false, expr = true })
        end,
    },
    {
        'antonk52/markdowny.nvim',
        config = function()
            require('markdowny').setup()
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            labels = "arstoienhdwfpyulgjqzxcvmkb",
            modes = {
                -- options used when flash is activated through
                -- `f`, `F`, `t`, `T`, `;` and `,` motions
                char = {
                    enabled = false,
                },
            },
        },
        keys = {
            {
                "gl",
                mode = { "n", "o", "x" },
                function() require("flash").jump() end,
                desc = "Flash - Jump"
            },
            {
                "gy",
                mode = { "o" },
                function() require("flash").remote() end,
                desc = "Flash - Remote operation (o-mode)"
            },
            {
                "gt",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc = "Flash - Treesitter jump"
            },
            {
                "gT",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Flash - Treesitter search (o- and x-mode)"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc = "Flash - Toggle flash search (command-mode)"
            },
        },
    },
    'kosayoda/nvim-lightbulb',
    {
        "gbprod/cutlass.nvim",
        -- Set to not be lazy to predictably override the mappings of
        -- colemak.nvim, since the mappings for this plugin overlap for
        -- every key that this plugin touches.
        lazy = false,
        -- Priority is set to be 1 less than colemak.nvim, to ensure that
        -- colemak.nvim gets loaded first, followed by this plugin, leading to
        -- the following being overridden: c, C, s, S, d, D, x, X
        priority = 99,
        opts = {
            cut_key = "x",
            override_del = true,
            exclude = {},
            registers = {
                select = "_",
                delete = "_",
                change = "_",
            },
        }
    },
    {
        "sindrets/winshift.nvim",
        keys = {
            -- Start Win-Move mode:
            { "<C-W><C-M>", "<Cmd>WinShift<CR>",      mode = "n" },
            { "<C-W>m",     "<Cmd>WinShift<CR>",      mode = "n" },

            -- Swap two windows:
            { "<C-W>X",     "<Cmd>WinShift swap<CR>", mode = "n" },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local presets = require("which-key.plugins.presets")

            -- Disable all plugin presets, before calling `setup(opts)`.
            --
            -- This is done because I use my `colemak.nvim` plugin, where
            -- there are some mappings (e.g. `y` replacing `w`), which get a
            -- slight delay added to them. This would make sense with default
            -- Neovim mappings (i.e. it's OK for a 300ms pause after `y`),
            -- but with my altered mappings (navigating words with `y`
            -- instead), the delay becomes irritating. The setting of
            -- operators to `nil` is done to prevent all default
            -- configuration of these mappings.
            presets.operators["v"] = nil
            presets.operators["d"] = nil
            presets.operators["c"] = nil
            presets.operators["y"] = nil
            presets.operators["g~"] = nil
            presets.operators["gu"] = nil
            presets.operators["gU"] = nil
            presets.operators[">"] = nil
            presets.operators["<lt>"] = nil
            presets.operators["zf"] = nil
            presets.operators["!"] = nil
            presets.operators["v"] = nil
            presets.operators["V"] = nil

            require("which-key").setup({
                plugins = {
                    -- shows a list of your marks on ' and `
                    marks = true,
                    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    registers = true,
                    spelling = {
                        -- disabled, because this plugin is hard-coded to trigger
                        -- on z=, which in my Colemak configuration should be b=
                        -- instead.
                        enabled = false,
                    },
                    presets = {
                        -- many of the following features are disabled due to them
                        -- conflicting with my Colemak configuration, causing
                        -- delays in input and help on the wrong (default)
                        -- mappings.
                        operators = false,
                        motions = false,
                        text_objects = false,
                        windows = true,
                        nav = true,
                        z = false,
                        g = true,
                    },
                },
            })
            local wk = require("which-key")

            wk.register({
                ["<leader>"] = {
                    a = {
                        name = "Misc #1",
                        f = {
                            name = "Folds",
                            m = { name = "Foldmethod" }
                        },
                        s = { name = "Spelling" },
                        q = { name = "Buffer/Window closing (Sayonara)" },
                        y = { name = "Yank" }
                    },
                    m = { name = "Highlight words with color (Mark)" },
                    p = { name = "File name" }
                }
            }, {})
        end
    },

    -- Text objects
    {
        "kana/vim-textobj-indent",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_indent_no_default_key_mappings = 1
        end,
        keys = {
            {
                "ti",
                "<Plug>(textobj-indent-a)",
                mode = "x",
                desc = "Indentation - A"
            },
            {
                "ti",
                "<Plug>(textobj-indent-a)",
                mode = "o",
                desc = "Indentation - A"
            },
            {
                "ri",
                "<Plug>(textobj-indent-i)",
                mode = "x",
                desc = "Indentation - I"
            },
            {
                "ri",
                "<Plug>(textobj-indent-i)",
                mode = "o",
                desc = "Indentation - I"
            },
        }
    },
    {
        "saihoooooooo/vim-textobj-space",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_space_no_default_key_mappings = 1
        end,
        keys = {
            {
                "tS",
                "<Plug>(textobj-space-a)",
                mode = "x",
                desc = "Whitespace - A"
            },
            {
                "tS",
                "<Plug>(textobj-space-a)",
                mode = "o",
                desc = "Whitespace - A"
            },
            {
                "rS",
                "<Plug>(textobj-space-i)",
                mode = "x",
                desc = "Whitespace - I"
            },
            {
                "rS",
                "<Plug>(textobj-space-i)",
                mode = "o",
                desc = "Whitespace - I"
            },
        }
    },
    {
        "lucapette/vim-textobj-underscore",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_underscore_no_default_key_mappings = 1
        end,
        keys = {
            {
                "t_",
                "<Plug>(textobj-underscore-a)",
                mode = "x",
                desc = "Underscores - A"
            },
            {
                "t_",
                "<Plug>(textobj-underscore-a)",
                mode = "o",
                desc = "Underscores - A"
            },
            {
                "r_",
                "<Plug>(textobj-underscore-i)",
                mode = "x",
                desc = "Underscores - I"
            },
            {
                "r_",
                "<Plug>(textobj-underscore-i)",
                mode = "o",
                desc = "Underscores - I"
            },
        }
    },
    {
        "mattn/vim-textobj-url",
        dependencies = { "kana/vim-textobj-user" },
        -- Mappings adjusted to work with colemak.nvim.
        init = function()
            vim.g.textobj_url_no_default_key_mappings = 1
        end,
        keys = {
            {
                "tu",
                "<Plug>(textobj-url-a)",
                mode = "x",
                desc = "URL - A"
            },
            {
                "tu",
                "<Plug>(textobj-url-a)",
                mode = "o",
                desc = "URL - A"
            },
            {
                "ru",
                "<Plug>(textobj-url-i)",
                mode = "x",
                desc = "URL - I"
            },
            {
                "ru",
                "<Plug>(textobj-url-i)",
                mode = "o",
                desc = "URL - I"
            },
        }
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-git",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        }
    },
}

local host_specific_plugins = require("host_specific_plugins")

local lazy_setup_with_host_specific_plugins =
    table_concat(lazy_setup, host_specific_plugins)

require("lazy").setup(lazy_setup_with_host_specific_plugins)

local wildignore = "" ..
    "*.DS_Store," ..
    "*.aux," ..
    "*.bmp," ..
    "*.dll," ..
    "*.exe," ..
    "*.gif," ..
    "*.jpeg," ..
    "*.jpg," ..
    "*.luac," ..
    "*.manifest," ..
    "*.o," ..
    "*.obj," ..
    "*.orig," ..
    "*.out," ..
    "*.png," ..
    "*.pyc," ..
    "*.spl," ..
    "*.sw?," ..
    "*.toc," ..
    ".git," ..
    ".hg," ..
    ".svn," ..
    "migrations"

local suffixes = "" ..
    ".aux," ..
    ".bak," ..
    ".bbl," ..
    ".blg," ..
    ".brf," ..
    ".cb," ..
    ".dvi," ..
    ".idx," ..
    ".ilg," ..
    ".ind," ..
    ".info," ..
    ".inx," ..
    ".log," ..
    ".o," ..
    ".out," ..
    ".swp," ..
    ".toc," ..
    "~"

vim.opt.colorcolumn = "+1"
vim.opt.completeopt = "menu,menuone,preview,noinsert"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldmethod = "marker"
vim.opt.formatoptions = "qrn1t"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.iskeyword = vim.opt.iskeyword + "-"
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:∘"
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.showbreak = "…"
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 10
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.suffixes = suffixes
vim.opt.synmaxcol = 800
vim.opt.tabstop = 4
vim.opt.textwidth = 79
vim.opt.virtualedit = "block"
vim.opt.whichwrap = "b,s,[,],<,>,h,l"
vim.opt.wildignore = vim.opt.wildignore + wildignore
vim.opt.wildmode = "list:longest,full"
vim.opt.winbar = "%=%m %f%="

vim.cmd([[
" {{{1 swap files

set directory=~/.config/nvim/tmp/swap//

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
]])

require("mappings")
require("nvim-cmp")
require("lsp-configuration")
