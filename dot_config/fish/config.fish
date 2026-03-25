set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BAT_THEME "Monokai Extended"
set -gx RUBY_CONFIGURE_OPTS "--enable-install-doc"
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
set -gx LANG en_US.UTF-8

if status is-interactive
    fish_add_path ~/bin
    fish_add_path ~/.local/bin

    fzf_configure_bindings \
        --directory=\ef \
        --git_log=\el \
        --git_status=\es \
        --history=\cr \
        --processes=\ep \
        --variables=\ev

    mise activate fish | source

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

    # Git
    abbr g git
    abbr lg lazygit

    # Git - Branch (b)
    abbr gb "git branch"
    abbr gbc "git checkout -b"
    abbr gbl "git branch --verbose"
    abbr gbL "git branch --all --verbose"
    abbr gbpg 'git branch --verbose | grep -v "main" | grep -v "master" | grep -v "\*" | grep "\[gone\]" | awk "{print \$1}" | xargs -n 1 git branch -D'
    abbr gbpm 'git branch --merged | grep -v "main" | grep -v "master" | grep -v "\*" | xargs -n 1 git branch -d'

    # Git - Commit (c)
    abbr gc "git commit --verbose"
    abbr gca "git commit --verbose --all"
    abbr gcm "git commit --message"
    abbr gcam "git commit --all --message"
    abbr gco "git checkout"
    abbr gcf "git commit --amend --reuse-message HEAD"
    abbr gcF "git commit --verbose --amend"
    abbr gcs "git show"

    # Git - Fetch (f)
    abbr gf "git fetch"
    abbr gfa "git fetch --all"
    abbr gff "git pull --ff-only"
    abbr gfr "git pull --rebase"

    # Git - Index (i)
    abbr gia "git add"
    abbr giA "git add --patch"
    abbr gid "git diff --cached"
    abbr gir "git reset"

    # Git - Log (l)
    abbr gl "git log --topo-order"
    abbr gls "git log --topo-order --stat"
    abbr gld "git log --topo-order --stat --patch --full-diff"
    abbr glo "git log --topo-order --oneline"
    abbr glg "git log --topo-order --graph --oneline"
    abbr glga "git log --topo-order --graph --oneline --all"
    abbr glc "git shortlog --summary --numbered"

    # Git - Merge (m)
    abbr gm "git merge"
    abbr gmf "git merge --ff-only"
    abbr gma "git merge --abort"
    abbr gmt "git mergetool"

    # Git - Push (p)
    abbr gp "git push"
    abbr gpf "git push --force-with-lease"
    abbr gpF "git push --force"
    abbr gpt "git push --tags"

    # Git - Rebase (r)
    abbr gr "git rebase"
    abbr gra "git rebase --abort"
    abbr grc "git rebase --continue"
    abbr gri "git rebase --interactive"
    abbr grs "git rebase --skip"

    # Git - Remote (R)
    abbr gR "git remote"
    abbr gRl "git remote --verbose"

    # Git - Stash (s)
    abbr gs "git stash"
    abbr gsa "git stash apply"
    abbr gsx "git stash drop"
    abbr gsl "git stash list"
    abbr gsd "git stash show --patch --stat"
    abbr gsp "git stash pop"
    abbr gss "git stash save --include-untracked"
    abbr gsS "git stash save --patch --no-keep-index"
    abbr gsw "git stash save --include-untracked --keep-index"

    # Git - Submodule (S)
    abbr gS "git submodule"
    abbr gSI "git submodule update --init --recursive"
    abbr gSu "git submodule update --remote --recursive"

    # Git - Tag (t)
    abbr gt "git tag"
    abbr gtl "git tag --list"
    abbr gts "git tag --sign"

    # Git - Working copy (w)
    abbr gws "git status --short"
    abbr gwS "git status"
    abbr gwd "git diff --no-ext-diff"
    abbr gwD "git diff --no-ext-diff --word-diff"
end
