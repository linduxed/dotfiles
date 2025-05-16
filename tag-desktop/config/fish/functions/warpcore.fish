function warpcore --wraps='play' --description 'Use the "play" command from "sox" to generate warpcore sound.'
  play -c2 -n synth whitenoise band -n 100 25 band -n 300 100 gain +25 $argv
end
