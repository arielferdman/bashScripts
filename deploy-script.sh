sudo chmod +x $1 && sudo cp $1 /usr/bin/$(echo "$1" | cut -d'.' -f 1)