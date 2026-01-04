#!/bin/bash
set -e
source dependencies.sh
echo "Downloading BYOND version $BYOND_MAJOR.$BYOND_MINOR."
curl "https://puu.sh/KGrYe/6a71eef0dd.zip" -o C:/byond.zip
