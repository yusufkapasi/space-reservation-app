#!/bin/bash

# Set environment variables
export ANDROID_HOME=/home/runner/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
export JAVA_HOME=/nix/store/2vwkssqpzykk37r996cafq7x63imf4sp-openjdk-21+35

# Display versions
echo "Using Java version:"
$JAVA_HOME/bin/java -version
echo "Android SDK location: $ANDROID_HOME"

# Run Gradle with Java 17
$JAVA_HOME/bin/java -version
cd .
./gradlew assembleDebug -x lint -x test --no-daemon --configure-on-demand -Dorg.gradle.jvmargs="-Xmx1536m -XX:+HeapDumpOnOutOfMemoryError"