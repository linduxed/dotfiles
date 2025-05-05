function cdown --description "Countdown with sound"
    function __notification-sound --description "Plays notification sound"
        mpv --volume=70 ~/.sounds/notification >/dev/null 2>&1
    end

    termdown --no-figlet --title $argv[1] $argv[2];
    and echo $argv[1]
    and __notification-sound
    and sleep 1
    and mimic -t "$argv[1]"
end
