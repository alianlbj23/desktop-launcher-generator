#!/bin/bash
# generate_desktop_fixed.sh
# Define the shell scripts and names for which to create .desktop launchers.

USER_NAME=$(whoami)
DESKTOP_DIR="/home/$USER_NAME/Desktop"

# Manually set: Display Name and Script Path
SCRIPTS=(
  "Rosbridge Start:/home/jetson/workspace/pros_app/rosbridge_server.sh"
  "Zlink Start:/home/jetson/workspace/zlink-bus-servo-driver/car_activate.sh"
)

for entry in "${SCRIPTS[@]}"; do
  NAME="${entry%%:*}"
  SCRIPT_PATH="${entry##*:}"

  if [ ! -f "$SCRIPT_PATH" ]; then
    echo "⚠️  Script '$SCRIPT_PATH' not found, skipping $NAME."
    continue
  fi

  DESKTOP_FILE="$DESKTOP_DIR/${NAME// /_}.desktop"
  cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=$NAME
Comment=Launcher for $NAME
Exec=$SCRIPT_PATH
Path=$(dirname "$SCRIPT_PATH")
Terminal=true
Icon=utilities-terminal
Categories=Utility;
EOF

  chmod +x "$SCRIPT_PATH"            # Ensure the target script is executable
  chmod +x "$DESKTOP_FILE"
  gio set "$DESKTOP_FILE" metadata::trusted true

  echo "✅ Created: $DESKTOP_FILE"
done
