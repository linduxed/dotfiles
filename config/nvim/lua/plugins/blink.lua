return {
    {
        "saghen/blink.cmp",
        opts = {
            completion = {
                ghost_text = {
                    show_with_menu = false
                },
            },
            sources = {
                providers = {
                    lsp = { async = true },
                },
            },
        },
    },
}
