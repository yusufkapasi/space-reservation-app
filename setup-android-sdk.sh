#!/bin/bash

# Create Android SDK directory
mkdir -p /home/runner/android-sdk
cd /home/runner/android-sdk

# Download the command line tools
echo "Downloading Android SDK Command-line Tools..."
curl -o commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/
rmdir cmdline-tools
rm commandlinetools.zip

# Set up SDK environment variables
export ANDROID_HOME=/home/runner/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

# Accept licenses automatically
mkdir -p $ANDROID_HOME/licenses
echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license
echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > $ANDROID_HOME/licenses/android-sdk-preview-license

# Install required SDK components without prompting
echo "Installing Android SDK components..."
sdkmanager --verbose "platforms;android-34" "platforms;android-33" "build-tools;33.0.1" "build-tools;33.0.2" "platform-tools"

echo "Android SDK setup completed!"