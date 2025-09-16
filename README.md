# Desktop Launcher Generator

A lightweight Bash utility to generate `.desktop` launchers on Ubuntu or NVIDIA Jetson devices.  
It creates clickable desktop icons for your frequently used shell scripts, making it easy to start services or tools without opening a terminal.

## ✨ Features
- **Simple**: Define script names and paths directly in one file—no external parser or YAML needed.
- **Automated**: Creates `.desktop` files in the user's `Desktop` directory.
- **Trusted Launchers**: Automatically sets permissions and trust flags for GNOME (`gio set`).
- **Customizable**: Easily add or remove entries by editing the script.

---

## 📦 Installation
Clone this repository:
```bash
git clone <your-repo-url>
cd desktop-launcher-generator
```

## ▶ Usage
1. Edit the script to add your shell script paths

    Open `generate_desktop_fixed.sh` in a text editor and replace or add entries in the SCRIPTS array:

    ```bash
    # Manually set: Display Name and Script Path
    SCRIPTS=(
    "Rosbridge Start:/home/jetson/workspace/pros_app/rosbridge_server.sh"
    "Zlink Start:/home/jetson/workspace/zlink-bus-servo-driver/car_activate.sh"
    # Add more entries here in the format:
    # "Display Name:/absolute/path/to/your_script.sh"
    )
    ```

    - Display Name will be the launcher’s title on your desktop.
    - Absolute Path must point to an existing, executable .sh script.

2. Run the generator

    ```bash
    ./generate_desktop_fixed.sh
    ```