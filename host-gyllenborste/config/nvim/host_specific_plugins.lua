return {
    "tpope/vim-rake",
    {
        "LucHermitte/lh-vim-lib",
        dependencies = {
            "LucHermitte/local_vimrc"
        }
    },
    "shumphrey/fugitive-gitlab.vim",
    {
        "neoclide/coc-solargraph",
        build = "yarn install --frozen-lockfile && npm run prepare"
    },
    {
        "amiralies/coc-elixir",
        build = "yarn install --frozen-lockfile && npm run prepack"
    },
}
