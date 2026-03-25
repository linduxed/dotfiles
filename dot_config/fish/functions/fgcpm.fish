function fgcpm --description '"git commit" using body from previous commit'
    # Use fzf to interactively select a commit
    set selected_commit (
        git log --pretty=format:"%h %s" |
        awk '{msg=substr($0, index($0,$2)); if (!seen[msg]++) print $0}' |
        fzf \
            --prompt="unique commit titles > " \
            --no-multi \
            --preview-window="top" \
            --preview="git show {1}"
    )

    # Extract the commit hash from the selected commit
    set commit_hash (echo $selected_commit | awk '{print $1}')

    # Check if a commit was selected
    if test -n "$commit_hash"
        # Use git commit with --reuse-message option
        git commit --reuse-message=$commit_hash
    else
        echo "No commit selected."
    end
end
