coord=$(xdotool getmouselocation | sed -e 's/ screen:0 window:[^ ]*//g');curl -X POST -d "$coord" http://localhost:8080/
