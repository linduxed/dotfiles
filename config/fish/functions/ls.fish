function ls --wraps=eza --description "eza, with reminder to not use 'ls'"
  echo "Use eza (alias \"e\") instead" && eza $argv
end
