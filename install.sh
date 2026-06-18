#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'

URL="https://github.com/c-Nojoom/T.Sin/releases/latest/download/T.Sin"

echo -e "${GREEN}[*] Downloading latest T.Sin...${NC}"

curl -fsL "$URL" -o /usr/local/bin/T.Sin

if [ ! -f /usr/local/bin/T.Sin ] || [ $(stat -c%s /usr/local/bin/T.Sin) -lt 1000 ]; then
    echo -e "\033[0;31m[!] Error: Could not download the file.\033[0m"
    echo -e "Make sure you have at least one Release published as 'Latest' in your GitHub repo."
    exit 1
fi

chmod +x /usr/local/bin/T.Sin
ln -sf /usr/local/bin/T.Sin /usr/local/bin/T.sin
ln -sf /usr/local/bin/T.Sin /usr/local/bin/tsin

echo -e "${GREEN}[*] Running T.Sin...${NC}"
PYTHONWARNINGS="ignore" /usr/local/bin/T.Sin </dev/tty
