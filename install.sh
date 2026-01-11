#!/bin/bash

GAME_DIR="/usr/share/blindsort-tty"
GAME_SCRIPT="game.sh"
INSTALL_SCRIPT="$GAME_DIR/game.sh"
BIN_PATH="/usr/local/bin/blindsort-tty"

if [[ $EUID -ne 0 ]]; then
   echo "Please run as root (sudo bash ./install.sh)." 
   exit 1
fi

echo "Installing Blind Sort TTY game..."

if [ ! -f "$GAME_SCRIPT" ]; then
    echo "Error: $GAME_SCRIPT not found in current directory."
    exit 1
fi

mkdir -p "$GAME_DIR"

cp "$GAME_SCRIPT" "$INSTALL_SCRIPT"

chmod +x "$INSTALL_SCRIPT"

cat > "$BIN_PATH" << EOF
#!/bin/bash
/usr/bin/env bash "$INSTALL_SCRIPT" "\$@"
EOF

chmod +x "$BIN_PATH"

echo "Installation complete!"
echo "You can now run the game by typing: blindsort-tty"
