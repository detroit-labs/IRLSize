#!/bin/bash

set -ev

rc=0

for OS in 10.0 10.1 10.2 10.3; do 
	for device in "iPhone SE" "iPhone 7" "iPhone 7 Plus" "iPad Pro (9.7 inch)" "iPad Pro (12.9 inch)"; do
		xcodebuild -workspace "Example/IRLSizeExample.xcworkspace" \
		           -scheme "IRLSizeExample" \
		           -destination "name=${device},OS=${OS},platform=iOS Simulator" \
		           -configuration Debug test | bundle exec xcpretty -c;

		((rc += $?))
	done
done

if [ $rc == 0 ]; then
	pod lib lint
	((rc += $?))
fi

exit $rc
