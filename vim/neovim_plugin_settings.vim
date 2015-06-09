" {{{1 Neomake

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_warning_sign = {
  \ 'text': '>>',
  \ 'texthl': 'Todo',
  \ }
let g:neomake_error_sign = {
  \ 'texthl': 'Error',
  \ }
autocmd! BufWritePost * Neomake
