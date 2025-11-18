set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BAT_THEME "Monokai Extended"
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
    abbr syc systemctl
    abbr sycu systemctl --user

    # Git
    abbr g git
    abbr lg lazygit

    # Git - Branch (b)
    abbr gb "git branch"
    abbr gba "git branch --all --verbose"
    abbr gbc "git checkout -b"
    abbr gbd "git branch --delete"
    abbr gbD "git branch --delete --force"
    abbr gbl "git branch --verbose"
    abbr gbL "git branch --all --verbose"
    abbr gbm "git branch --move"
    abbr gbM "git branch --move --force"
    abbr gbpg 'git branch --verbose | grep -v "main" | grep -v "master" | grep -v "\*" | grep "\[gone\]" | awk "{print \$1}" | xargs -n 1 git branch -D'
    abbr gbpm 'git branch --merged | grep -v "main" | grep -v "master" | grep -v "\*" | xargs -n 1 git branch -d'
    abbr gbr "git branch --move"
    abbr gbR "git branch --move --force"
    abbr gbs "git show-branch"
    abbr gbS "git show-branch --all"
    abbr gbv "git branch --verbose"
    abbr gbV "git branch --verbose --verbose"
    abbr gbx "git branch --delete"
    abbr gbX "git branch --delete --force"

    # Git - Commit (c)
    abbr gc "git commit --verbose"
    abbr gca "git commit --verbose --all"
    abbr gcm "git commit --message"
    abbr gcam "git commit --all --message"
    abbr gco "git checkout"
    abbr gcO "git checkout --patch"
    abbr gcf "git commit --amend --reuse-message HEAD"
    abbr gcF "git commit --verbose --amend"
    abbr gcp "git cherry-pick --ff"
    abbr gcP "git cherry-pick --no-commit"
    abbr gcr "git revert"
    abbr gcs "git show"
    abbr gcsS "git show --pretty=short --show-signature"
    abbr gcy "git cherry --verbose --abbrev"
    abbr gcY "git cherry --verbose"

    # Git - Conflict (C)
    abbr gCl "git --no-pager diff --name-only --diff-filter=U"
    abbr gCo "git checkout --ours --"
    abbr gCt "git checkout --theirs --"

    # Git - Data (d)
    abbr gd "git ls-files"
    abbr gdc "git ls-files --cached"
    abbr gdx "git ls-files --deleted"
    abbr gdm "git ls-files --modified"
    abbr gdu "git ls-files --other --exclude-standard"
    abbr gdk "git ls-files --killed"
    abbr gdi 'git status --porcelain --short --ignored | sed -n "s/^!! //p"'

    # Git - Fetch (f)
    abbr gf "git fetch"
    abbr gfa "git fetch --all"
    abbr gfcr "git clone --recurse-submodules"
    abbr gfm "git pull"
    abbr gff "git pull --ff-only"
    abbr gfma "git pull --autostash"
    abbr gfr "git pull --rebase"
    abbr gfra "git pull --rebase --autostash"

    # Git - Index (i)
    abbr gia "git add"
    abbr giA "git add --patch"
    abbr giu "git add --update"
    abbr gid "git diff --cached"
    abbr giD "git diff --cached --word-diff"
    abbr gii "git update-index --assume-unchanged"
    abbr giI "git update-index --no-assume-unchanged"
    abbr gir "git reset"
    abbr giR "git reset --patch"
    abbr girs "git reset --soft"
    abbr girh "git reset --hard"
    abbr girp 'git reset "HEAD^"'
    abbr gix "git rm -r --cached"
    abbr giX "git rm -r --force --cached"

    # Git - Log (l)
    abbr gl "git log --topo-order"
    abbr gls "git log --topo-order --stat"
    abbr gld "git log --topo-order --stat --patch --full-diff"
    abbr glo "git log --topo-order --oneline"
    abbr glg "git log --topo-order --graph --oneline"
    abbr glga "git log --topo-order --graph --oneline --all"
    abbr glc "git shortlog --summary --numbered"
    abbr glS "git log --show-signature"

    # Git - Merge (m)
    abbr gm "git merge"
    abbr gmC "git merge --no-commit"
    abbr gmf "git merge --ff-only"
    abbr gmF "git merge --no-ff"
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
    abbr gRa "git remote add"
    abbr gRx "git remote rm"
    abbr gRm "git remote rename"
    abbr gRu "git remote update"
    abbr gRp "git remote prune"
    abbr gRs "git remote show"

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
    abbr gSa "git submodule add"
    abbr gSf "git submodule foreach"
    abbr gSi "git submodule init"
    abbr gSI "git submodule update --init --recursive"
    abbr gSl "git submodule status"
    abbr gSs "git submodule sync"
    abbr gSu "git submodule update --remote --recursive"

    # Git - Tag (t)
    abbr gt "git tag"
    abbr gtl "git tag --list"
    abbr gts "git tag --sign"
    abbr gtv "git verify-tag"

    # Git - Working copy (w)
    abbr gws "git status --short"
    abbr gwS "git status"
    abbr gwd "git diff --no-ext-diff"
    abbr gwD "git diff --no-ext-diff --word-diff"
    abbr gwc "git clean --dry-run"
    abbr gwC "git clean --force"
    abbr gwx "git rm -r"
    abbr gwX "git rm -r --force"
end
