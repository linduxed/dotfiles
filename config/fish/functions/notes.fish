function notes --description 'Manage notes repository'
    function __print_help --description "Print 'notes' help."
        printf "Usage: notes [-smh]\n\n"
        printf "         -s --sync     Stage all files, commit, pull-rebase latest, push\n"
        printf "         -m --cd       `cd` to the notes directory\n"
        printf "         -h --help     Print this help\n"
    end

    function __notes_sync --description "Stage all files, commit, pull-rebase latest, push"
        set -l notes_dir "$HOME/vimwiki"

        git -C $notes_dir add . &&
        git -C $notes_dir commit -m "$(hostname): $(date -Iseconds)" &&
        git -C $notes_dir pull --rebase &&
        git -C $notes_dir push
    end

    function __notes_cd --description "`cd` to the notes directory"
        set -l notes_dir "$HOME/vimwiki"

        cd $notes_dir
    end

    set -l options s/sync m/cd h/help

    argparse $options -- $argv

    if set -q _flag_help
        __print_help
        return 0
    else if set -q _flag_cd
        __notes_cd
        return 0
    else if set -q _flag_sync
        __notes_sync
        return 0
    end
end
