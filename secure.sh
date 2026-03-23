#!/usr/bin/env bash
#
# Hardens a fresh server:
#   - Changes SSH port to a random 5xxxx port
#   - Installs and configures UFW (allow only SSH port)
#   - Disables SSH password authentication
#   - Disables SSH root login

set -euo pipefail

die() {
    echo "ERROR: $*" >&2
    exit 1
}

[ "$(id -u)" -eq 0 ] || die "Run as root: sudo $0"

# Generate random port in range 50000-59999
SSH_PORT=$((50000 + RANDOM % 10000))

echo "==> New SSH port: $SSH_PORT"
echo "    Reconnect on this port after the script finishes!"
echo ""

SSHD_CONFIG="/etc/ssh/sshd_config"

[ -f "$SSHD_CONFIG" ] || die "sshd_config not found at $SSHD_CONFIG"

# Backup original config
cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak"

# Remove cloud-init override (sets PasswordAuthentication yes)
rm -f /etc/ssh/sshd_config.d/50-cloud-init.conf

# Set port
sed -i "s/^#\?Port .*/Port $SSH_PORT/" "$SSHD_CONFIG"
grep -q "^Port " "$SSHD_CONFIG" || echo "Port $SSH_PORT" >> "$SSHD_CONFIG"

# Disable password authentication
sed -i "s/^#\?PasswordAuthentication .*/PasswordAuthentication no/" "$SSHD_CONFIG"
grep -q "^PasswordAuthentication " "$SSHD_CONFIG" || echo "PasswordAuthentication no" >> "$SSHD_CONFIG"

# Disable root login
sed -i "s/^#\?PermitRootLogin .*/PermitRootLogin no/" "$SSHD_CONFIG"
grep -q "^PermitRootLogin " "$SSHD_CONFIG" || echo "PermitRootLogin no" >> "$SSHD_CONFIG"

echo "==> SSH config updated"

# Install ufw
if command -v pacman &>/dev/null; then
    pacman -S --noconfirm --needed ufw
elif command -v apt &>/dev/null; then
    apt install -y ufw
else
    die "Unsupported package manager"
fi

# Configure UFW
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow "$SSH_PORT/tcp"
ufw --force enable

echo "==> UFW enabled, only port $SSH_PORT/tcp allowed inbound"

# Restart SSH
systemctl restart sshd || systemctl restart ssh

echo ""
echo "==> Done. Reconnect using: ssh -p $SSH_PORT user@host"
echo "    Original sshd_config backed up to ${SSHD_CONFIG}.bak"
