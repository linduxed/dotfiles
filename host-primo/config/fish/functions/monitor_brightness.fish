function monitor_brightness --description "Changes brightness with ddcutil on monitors 1 & 2"
    sudo ddcutil -d 1 setvcp 10 $argv[1] $argv[2]
    sudo ddcutil -d 2 setvcp 10 $argv[1] $argv[2]
end
