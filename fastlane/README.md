fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### lint
```
fastlane lint
```

### tests
```
fastlane tests
```

### sonar
```
fastlane sonar
```

### screenshot
```
fastlane screenshot
```
Take screenshots
### build
```
fastlane build
```
Create ipa
### upload
```
fastlane upload
```
Upload to App Store
### run_lanes
```
fastlane run_lanes
```
Create app, take screenshots, build and upload to App Store

----

## iOS
### ios create_app
```
fastlane ios create_app
```
Create app on Apple Developer and App Store Connect sites

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
