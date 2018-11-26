#!/bin/bash

xcodebuild clean build-for-testing \
    -workspace EventyayOrganizer.xcworkspace \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 8,OS=12.0' \
    -scheme EventyayOrganizer | xcpretty -c && exit ${PIPESTATUS[0]}
