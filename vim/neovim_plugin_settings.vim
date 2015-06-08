" {{{1 Neomake

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
autocmd! BufWritePost * Neomake
