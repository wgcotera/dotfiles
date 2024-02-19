#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@"
fi

echo -e "\e[94mInstalling Jetbrains Toolbox\e[39m"

# Function to get the latest URL for the Toolbox download
getLatestUrl() {
  USER_AGENT=(
    'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'
  )
  URL=$(curl 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' \
    -H 'Origin: https://www.jetbrains.com' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H "${USER_AGENT[@]}" \
    -H 'Accept: application/json, text/javascript, */*; q=0.01' \
    -H 'Referer: https://www.jetbrains.com/toolbox/download/' \
    -H 'Connection: keep-alive' \
    -H 'DNT:  1' \
    --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}' | sed 's/[", ]//g')
  echo $URL
}

# Get the latest URL and download the Toolbox
getLatestUrl
FILE=$(basename ${URL})
DEST=$PWD/$FILE

echo -e "\e[94mDownloading Toolbox files\e[39m"
wget -cO ${DEST} ${URL} --read-timeout=5 --tries=0
echo -e "\e[32mDownload complete!\e[39m"

# Install to /opt/jetbrains-toolbox
DIR="/opt/jetbrains-toolbox"
echo -e "\e[94mInstalling to $DIR\e[39m"
if mkdir ${DIR}; then
  tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi
chmod -R +rwx ${DIR}
touch ${DIR}/jetbrains-toolbox.sh
echo "$DIR/jetbrains-toolbox" >> $DIR/jetbrains-toolbox.sh

# Create a symlink to the toolbox executable
ln -s ${DIR}/jetbrains-toolbox.sh /usr/local/bin/jetbrains-toolbox
chmod -R +rwx /usr/local/bin/jetbrains-toolbox

# Clean up the downloaded file
rm ${DEST}
echo -e "\e[32mDone.\e[39m"
