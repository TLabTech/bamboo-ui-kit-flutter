#!/bin/bash

echo "🧹 Deep cleaning iOS build environment..."

# Remove Flutter build
cd ..
flutter clean

# Clean iOS
cd ios
rm -rf Pods
rm -rf .symlinks
rm Podfile.lock
rm -rf build

# Clean ALL Xcode caches
rm -rf ~/Library/Developer/Xcode/DerivedData/*
rm -rf ~/Library/Developer/Xcode/DerivedData/SDKStatCaches.noindex
rm -rf ~/Library/Caches/com.apple.dt.Xcode

echo "✅ Clean complete!"
echo "🔄 Reinstalling dependencies..."

# Reinstall
cd ..
flutter pub get
cd ios
pod install

echo "✅ Ready to build!"