#!/bin/bash

# Script to create an Xcode iOS App Project
# This script creates a proper iOS app using Xcode command line tools

set -e

echo "🚀 Creating Xcode iOS App Project..."

# Variables
PROJECT_NAME="MyApp"
BUNDLE_ID="com.mycompany.myapp"
ORGANIZATION="MyOrganization"
PROJECT_DIR="$(pwd)"

# Create a temporary directory for the Xcode project template
TEMP_DIR="${PROJECT_DIR}/XcodeProject"

echo "📁 Creating project directory structure..."
mkdir -p "${TEMP_DIR}"

# Create Info.plist
echo "📝 Creating Info.plist..."
cat > "${TEMP_DIR}/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>\$(DEVELOPMENT_LANGUAGE)</string>
    <key>CFBundleDisplayName</key>
    <string>${PROJECT_NAME}</string>
    <key>CFBundleExecutable</key>
    <string>\$(EXECUTABLE_NAME)</string>
    <key>CFBundleIdentifier</key>
    <string>\$(PRODUCT_BUNDLE_IDENTIFIER)</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>\$(PRODUCT_NAME)</string>
    <key>CFBundlePackageType</key>
    <string>\$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>UIApplicationSceneManifest</key>
    <dict>
        <key>UIApplicationSupportsMultipleScenes</key>
        <true/>
    </dict>
    <key>UIApplicationSupportsIndirectInputEvents</key>
    <true/>
    <key>UILaunchScreen</key>
    <dict/>
    <key>UIRequiredDeviceCapabilities</key>
    <array>
        <string>armv7</string>
    </array>
    <key>UISupportedInterfaceOrientations</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>
    <key>UISupportedInterfaceOrientations~ipad</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationPortraitUpsideDown</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>
</dict>
</plist>
EOF

# Copy source files to Xcode project
echo "📦 Copying source files..."
cp -r App "${TEMP_DIR}/"
cp -r Models "${TEMP_DIR}/"
cp -r ViewModels "${TEMP_DIR}/"
cp -r Views "${TEMP_DIR}/"
cp -r Services "${TEMP_DIR}/"
cp -r Utilities "${TEMP_DIR}/"

# Create Assets.xcassets
echo "🎨 Creating Assets catalog..."
mkdir -p "${TEMP_DIR}/Assets.xcassets/AppIcon.appiconset"
cat > "${TEMP_DIR}/Assets.xcassets/AppIcon.appiconset/Contents.json" << EOF
{
  "images" : [
    {
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

mkdir -p "${TEMP_DIR}/Assets.xcassets/AccentColor.colorset"
cat > "${TEMP_DIR}/Assets.xcassets/AccentColor.colorset/Contents.json" << EOF
{
  "colors" : [
    {
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

cat > "${TEMP_DIR}/Assets.xcassets/Contents.json" << EOF
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

# Create Preview Content
mkdir -p "${TEMP_DIR}/Preview Content/Preview Assets.xcassets"
cat > "${TEMP_DIR}/Preview Content/Preview Assets.xcassets/Contents.json" << EOF
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

echo ""
echo "✅ Xcode project structure created in: ${TEMP_DIR}"
echo ""
echo "📱 Next Steps:"
echo "1. Open Xcode"
echo "2. Select: File → New → Project → iOS → App"
echo "3. Set the following:"
echo "   - Product Name: ${PROJECT_NAME}"
echo "   - Team: (Select your team)"
echo "   - Organization Identifier: ${ORGANIZATION}"
echo "   - Bundle Identifier: ${BUNDLE_ID}"
echo "   - Interface: SwiftUI"
echo "   - Language: Swift"
echo "4. Save the project to: ${PROJECT_DIR}"
echo "5. Replace the generated files with the files from ${TEMP_DIR}"
echo ""
echo "Alternatively, open the Package.swift in Xcode:"
echo "   open Package.swift"
echo ""
