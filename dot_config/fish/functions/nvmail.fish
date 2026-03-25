function nvmail --wraps=nvim --description 'Edit empty text file in tmp-dir'
    set -l timestamp (date "+%F--%T")

    nvim /tmp/nvmail_$timestamp.mail -c "set spell" -c "set spelllang=en" -c "setf mail" -c "set linebreak" -c "set tw=0" $argv
end
