#!/bin/sh

# Author : Chandu J S
# Copyright (c) chandujs.com

# This script copies files mentioned inside `backup.conf` to the root of the project,
# while preserving the folder structure.

# File to look for the paths to backup.
backupPaths="./backup.list"
# Home directory path.
homeDirectory=~

# Backup directory
backupDirectory="backup"

echo "🛑 Clearing $backupDirectory directory..."
# Removing the folder with existing contents. We have git version anyway!
rm -rf "$backupDirectory"
# Creating it again for backup.
mkdir "$backupDirectory"
sleep 1
echo "✅ Backup directory cleared."
sleep 1

echo "🏁 Starting backup..."
sleep 1

# Looping through the list & avoiding empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
  echo "⏳ Processing: $filePath"

  # Replace ~ with home path
  findThis="~/"
  replaceWith="$homeDirectory/"
  originalFile="${filePath//${findThis}/${replaceWith}}"

  # Compute the relative path for destination
  relativePath=$(dirname "$filePath")
  destinationPath="./$backupDirectory/${relativePath#~/}"

  # Create the destination directory structure
  mkdir -p "$destinationPath"

  # Copy the file to the destination while preserving structure
  cp -P -R "$originalFile" "$destinationPath"
  sleep 0.05
done

git add .

echo "🎉 Backup finished! You can review & commit your changes."
