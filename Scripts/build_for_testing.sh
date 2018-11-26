#!/bin/bash

xcodebuild clean build-for-testing \
    -workspace Eventyay\ Organizer.xcworkspace \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 8,OS=12.0' \
    -scheme Eventyay\ Organizer | xcpretty -c && exit ${PIPESTATUS[0]}
