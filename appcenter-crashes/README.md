<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>

<h3 align="center">App Center Crashes</h3>
<p align="center"><strong><code>@capacitor-community/appcenter-crashes</code></strong></p>
<p align="center">
  App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2021?style=flat-square" />
  <img src="https://img.shields.io/badge/Capacitor%20V3%20Support-yes-green?logo=Capacitor&style=flat-square" />
  <a href="https://github.com/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter/actions?query=workflow%3A%22CI%22"></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-crashes"><img src="https://img.shields.io/npm/l/@capacitor-community/appcenter-crashes?style=flat-square" /></a>
  <br>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-crashes"><img src="https://img.shields.io/npm/dw/@capacitor-community/appcenter-crashes?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-crashes"><img src="https://img.shields.io/npm/v/@capacitor-community/appcenter-crashes?style=flat-square" /></a>
</p>

## Maintainers

| Maintainer | GitHub | Social |
| -----------| -------| -------|
| John Borges | [johnborges](https://github.com/johnborges) | [@johnborges](https://twitter.com/johnborges) |

## Features

- Generate test crashes
- Get more information about a previous crash
- Customize how crashes are processed
- Enable or disable App Center Crashes at runtime

## Install

```bash
npm install @capacitor-community/appcenter-crashes
npx cap sync
```

## API

<docgen-index>

* [`isEnabled()`](#isenabled)
* [`setEnabled(...)`](#setenabled)
* [`generateTestCrash()`](#generatetestcrash)
* [`hasReceivedMemoryWarningInLastSession()`](#hasreceivedmemorywarninginlastsession)
* [`hasCrashedInLastSession()`](#hascrashedinlastsession)
* [`lastSessionCrashReport()`](#lastsessioncrashreport)
* [`trackError(...)`](#trackerror)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### isEnabled()

```typescript
isEnabled() => Promise<{ value: boolean; }>
```

Check if Crashes is enabled or not.

**Returns:** <code>Promise&lt;{ value: boolean; }&gt;</code>

**Since:** 0.1.0

--------------------


### setEnabled(...)

```typescript
setEnabled(options: { enable: boolean; }) => Promise<void>
```

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK won't do any crash reporting for the app.
The state is persisted in the device's storage across application launches.

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ enable: boolean; }</code> |

**Since:** 0.1.0

--------------------


### generateTestCrash()

```typescript
generateTestCrash() => Promise<void>
```

Generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

**Since:** 0.2.0

--------------------


### hasReceivedMemoryWarningInLastSession()

```typescript
hasReceivedMemoryWarningInLastSession() => Promise<{ value: boolean; }>
```

Check if app recieved memory warning in the last session.

**Returns:** <code>Promise&lt;{ value: boolean; }&gt;</code>

**Since:** 0.2.0

--------------------


### hasCrashedInLastSession()

```typescript
hasCrashedInLastSession() => Promise<{ value: boolean; }>
```

Check if the app has crashed in the last session.

**Returns:** <code>Promise&lt;{ value: boolean; }&gt;</code>

**Since:** 0.3.0

--------------------


### lastSessionCrashReport()

```typescript
lastSessionCrashReport() => Promise<{ value: ErrorReport; }>
```

Provides details about the crash that occurred in the last app session.

**Returns:** <code>Promise&lt;{ value: <a href="#errorreport">ErrorReport</a>; }&gt;</code>

**Since:** 0.3.0

--------------------


### trackError(...)

```typescript
trackError(errorModel: TrackableErrorModel) => Promise<{ value: string; }>
```

Track error

| Param            | Type                                                                |
| ---------------- | ------------------------------------------------------------------- |
| **`errorModel`** | <code><a href="#trackableerrormodel">TrackableErrorModel</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

**Since:** 0.5.0

--------------------


### Interfaces


#### ErrorReport

| Prop                       | Type                                      | Description                                                          |
| -------------------------- | ----------------------------------------- | -------------------------------------------------------------------- |
| **`id`**                   | <code>string</code>                       | UUID for the crash report.                                           |
| **`threadName`**           | <code>string</code>                       | Thread name that triggered the crash                                 |
| **`appErrorTime`**         | <code>string \| number</code>             | Date and time the error occurred.                                    |
| **`appStartTime`**         | <code>string \| number</code>             | Date and time the app started.                                       |
| **`exceptionName`**        | <code>string</code>                       | Exception name that triggered the crash.                             |
| **`exceptionReason`**      | <code>string</code>                       | Exception reason.                                                    |
| **`device`**               | <code><a href="#device">Device</a></code> | <a href="#device">Device</a> information of the app when it crashed. |
| **`signal`**               | <code>string</code>                       | Signal that caused the crash.                                        |
| **`appProcessIdentifier`** | <code>number</code>                       | Identifier of the app process that crashed.                          |
| **`stackTrace`**           | <code>string</code>                       | The stack trace of the crash                                         |


#### Device

| Prop                 | Type                | Description                                                                                                                           |
| -------------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| **`sdkName`**        | <code>string</code> | Name of the SDK. Consists of the name of the SDK and the platform, e.g. "appcenter.ios", "appcenter.android"                          |
| **`sdkVersion`**     | <code>string</code> | Version of the SDK in semver format, e.g. "1.2.0" or "0.12.3-alpha.1".                                                                |
| **`model`**          | <code>string</code> | <a href="#device">Device</a> model (example: iPad2,3).                                                                                |
| **`oemName`**        | <code>string</code> | <a href="#device">Device</a> manufacturer (example: HTC).                                                                             |
| **`osName`**         | <code>string</code> | OS name (example: iOS).                                                                                                               |
| **`osVersion`**      | <code>string</code> | OS version (example: 9.3.0).                                                                                                          |
| **`osBuild`**        | <code>string</code> | OS build code (example: LMY47X).                                                                                                      |
| **`osApiLevel`**     | <code>number</code> | API level when applicable like in Android (example: 15).                                                                              |
| **`locale`**         | <code>string</code> | Language code (example: en_US).                                                                                                       |
| **`timeZoneOffset`** | <code>number</code> | The offset in minutes from UTC for the device time zone, including daylight savings time.                                             |
| **`screenSize`**     | <code>string</code> | Screen size of the device in pixels (example: 640x480).                                                                               |
| **`appVersion`**     | <code>string</code> | Application version name, e.g. 1.1.0                                                                                                  |
| **`carrierName`**    | <code>string</code> | Carrier name (for mobile devices).                                                                                                    |
| **`carrierCountry`** | <code>string</code> | Carrier country code (for mobile devices).                                                                                            |
| **`appBuild`**       | <code>string</code> | The app's build number, e.g. 42.                                                                                                      |
| **`appNamespace`**   | <code>string</code> | The bundle identifier, package identifier, or namespace, depending on what the individual plattforms use, .e.g com.microsoft.example. |


#### TrackableErrorModel

| Prop              | Type                                                              |
| ----------------- | ----------------------------------------------------------------- |
| **`error`**       | <code><a href="#exceptionmodeltype">ExceptionModelType</a></code> |
| **`properties`**  | <code>{ [name: string]: string; }</code>                          |
| **`attachments`** | <code>ErrorAttachmentLog[]</code>                                 |


#### ExceptionModelType

| Prop                 | Type                | Description                                        |
| -------------------- | ------------------- | -------------------------------------------------- |
| **`wrapperSdkName`** | <code>string</code> | Name of the wrapper SDK. e.g 'appcenter.capacitor' |
| **`type`**           | <code>string</code> | Exception type, e.g 'TypeException'                |
| **`message`**        | <code>string</code> | Exception message                                  |
| **`stackTrace`**     | <code>string</code> | Exception stacktrace                               |

</docgen-api>
