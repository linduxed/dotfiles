set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BAT_THEME "Monokai Extended"
set -gx RUBY_CONFIGURE_OPTS "--enable-install-doc"
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
set -gx LANG en_US.UTF-8

if status is-interactive
    fish_add_path ~/bin
    fish_add_path ~/.local/bin
    fish_add_path /usr/local/sbin

    # Miscellaneous

    abbr dl aria2c
    abbr nivm nvim
    abbr eixt exit
    abbr exti exit
    abbr xeit exit
    abbr xeti exit
    abbr xo xdg-open
    abbr unarchive dtrx
    abbr syc sudo systemctl
    abbr nsyc systemctl
    abbr sycu systemctl --user
    abbr joc sudo journalctl
    abbr njoc journalctl
    abbr jocu journalctl --user
end
