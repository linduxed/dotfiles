function speak_time --description "Speak time at specified minute interval"
    set -l interval (math "$argv[1]")

    if not contains $interval 1 2 3 4 5 6 10 15 20 30 60
        echo "Bad interval"
        return 1
    end

    # Get current time
    set -l current_second (date +%S | sed 's/^0*//')
    set -l current_minute (date +%M | sed 's/^0*//')

    # Default to 0 if empty (e.g., 00 minute or second)
    if test -z "$current_second"
        set current_second 0
    end
    if test -z "$current_minute"
        set current_minute 0
    end

    # Find the next multiple of the interval greater than the current minute
    set -l next_interval -1
    for n in (seq 1 60)
        if test (math "$n % $interval") -eq 0
            if test $n -gt $current_minute
                set next_interval $n
                break
            end
        end
    end

    # If we looped past the hour, wrap around
    if test $next_interval -eq -1
        set next_interval $interval
    end

    set -l minutes_until (math "$next_interval - $current_minute")
    set -l seconds_until (math "60 - $current_second + 60 * ($minutes_until - 1)")

    sleep $seconds_until

    watch -p -n (math "$interval * 60") "date +%R | mimic"
end

