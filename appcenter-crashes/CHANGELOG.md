# Change Log

## [1.0.1](https://github.com/capacitor-community/appcenter-sdk-capacitor/compare/@capacitor-community/appcenter-crashes@1.0.0...@capacitor-community/appcenter-crashes@1.0.1)

### Chore

* updating sdk to latest 4.4.x

## [1.0.1](https://github.com/capacitor-community/appcenter-sdk-capacitor/compare/@capacitor-community/appcenter-crashes@1.0.0...@capacitor-community/appcenter-crashes@1.0.1)

### Fixes

* **android**: change `setEnable` to `setEnabled`
* **ios**: use correct `enable` flag for `setEnabled`

## [1.0.0](https://github.com/capacitor-community/appcenter-sdk-capacitor/compare/@capacitor-community/appcenter-crashes@0.7.3...@capacitor-community/appcenter-crashes@1.0.0)

### Chore

* **ios**: Bump `AppCenterCapacitorShared` version to `1.0.0`

## [0.7.3](https://github.com/capacitor-community/appcenter-sdk-capacitor/compare/@capacitor-community/appcenter-crashes@0.7.2...@capacitor-community/appcenter-crashes@0.7.3)

### Chore

* **refactor**
  * change `ErrorReport` interface

## [0.7.2](https://github.com/capacitor-community/appcenter-sdk-capacitor/compare/@capacitor-community/appcenter-crashes@0.7.1...@capacitor-community/appcenter-crashes@0.7.2)

### Chore

* **style**
  * code style changes from linting

## [0.7.1](https://github.com/capacitor-community/appcenter-sdk-capacitor/compare/@capacitor-community/appcenter-crashes@0.7.0...@capacitor-community/appcenter-crashes@0.7.1)

### Fixes

* **ios**
  * Update `AppCenterCapacitorShared` to 0.3.5 and using optimistic operator

## 0.7.0

### Features

* **ios**: 
    * Update `AppCenter/Crashes` to 4.3.0
    * Update `AppCenterCapacitorShared` to 0.3.2
    * Implement `Crashes.trackError()` API after AppCenter/Crashes update

## 0.6.0

### Features

* **android**: Add `Crashes.trackError()` API to track handled errors in your app.
* **ios**: Add `Crashes.trackError()` API stub, it's not supported for iOS yet.

## 0.5.0

### Features

* **android**: Add `Crashes.lastSessionCrashReport()` API to get a report for the crash that happened in your last session in your app.

## 0.4.0

* adding Android support

## 0.3.1

* Update `Appcenter/Analytics` to 4.2.0
* Update `AppCenterCapacitorShared` to 0.3.1
* Update `docgen` to 0.0.17

## 0.3.0

### Features

* Add hasCrashedInLastSession api
* Add lastSessionCrashReport api
