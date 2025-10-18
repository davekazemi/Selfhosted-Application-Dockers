#!/bin/bash
# Fix icons and desktop background

# Clean up stale dbus files
rm -f /run/dbus/pid /run/dbus/system.pid 2>/dev/null

# Update icon cache
if command -v gtk-update-icon-cache &> /dev/null; then
    for icon_dir in /usr/share/icons/*; do
        if [ -d "$icon_dir" ]; then
            gtk-update-icon-cache -f -t "$icon_dir" 2>/dev/null || true
        fi
    done
fi

# Update desktop database
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database /usr/share/applications 2>/dev/null || true
    update-desktop-database /usr/local/share/applications 2>/dev/null || true
fi

# Update MIME database
if command -v update-mime-database &> /dev/null; then
    update-mime-database /usr/share/mime 2>/dev/null || true
fi

echo "Icon and desktop fixes applied successfully"

