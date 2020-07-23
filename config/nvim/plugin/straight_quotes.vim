function! StraightQuotes()
    %s/[„“‟”〝〞]/"/g
    %s/[’‘‛❛❜]/'/g
endfunction

command! StraightQuotes call StraightQuotes()
