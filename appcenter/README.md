<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>

<h3 align="center">App Center</h3>
<p align="center"><strong><code>@capacitor-community/appcenter</code></strong></p>
<p align="center">
  Capacitor Plugin for Microsoft's Visual Studio App Center SDK. Contains additional helper APIs suitable for some projects.
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2020?style=flat-square" />
  <a href="https://github.com/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter/actions?query=workflow%3A%22CI%22"><img src="https://img.shields.io/github/workflow/status/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter/CI?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter"><img src="https://img.shields.io/npm/l/@capacitor-community/app-icon?style=flat-square" /></a>
  <br>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter"><img src="https://img.shields.io/npm/dw/@capacitor-community/appcenter?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter"><img src="https://img.shields.io/npm/v/@capacitor-community/appcenter?style=flat-square" /></a>
  <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
  <a href="#contributors-"><img src="https://img.shields.io/badge/all%20contributors-0-orange?style=flat-square" /></a>
  <!-- ALL-CONTRIBUTORS-BADGE:END -->
</p>

## Maintainers

| Maintainer | GitHub | Social |
| -----------| -------| -------|
| John Borges | [johnborges](https://github.com/johnborges) | [@johnborges](https://twitter.com/johnborges) |

## Features

- Adjusting the Log Level
- Identify Users and Installations
- Control SDK Services
- Set Custom Properties

## Install

```bash
npm install @capacitor-community/appcenter
npx cap sync
```

## Configure Preferences
- `iosLogLevel` - _(optional, default is `7`)_ You can control the amount of log messages that show up from App Center. Log messages show in the console on iOS and LogCat on Android.
Setting the log level here is useful to capture logs before JavaScript is loaded. See [definitions](https://github.com/capacitor-community/appcenter-sdk-capacitor/blob/684fab0bdf15e4be82c48426c9c63d9f3d7039a7/appcenter/src/definitions.ts#L1) for supported Log Levels.

  Example:
  ```json
  {
    "appId": "com.example.app",
    "appName": "example",
    "webDir": "www",
    "bundledWebRuntime": false,
    "AppCenter": {
      "iosAppSecret": "0000-0000-0000-0000-000000000000",
      "iosLogLevel": 2,
      "androidAppSecret": "0000-0000-0000-0000-000000000000"
    }
    ...

  }
  ```

## Usage

```typescript
import AppCenter from '@capacitor-community/appcenter';

const appCenterInfo = async () => {

  try {
    const sdkEnabled = await AppCenter.isEnabled()
    const installId = await AppCenter.getInstallId()
    const sdkVersion = await AppCenter.getSdkVersion()

    this.installId = installId.value
    this.sdkVersion = sdkVersion.value
    this.enabled = sdkEnabled.value
  } catch (error) {
    console.error(error)
  }

}
```

## API

<docgen-index>

* [`getInstallId()`](#getinstallid)
* [`setUserId(...)`](#setuserid)
* [`getSdkVersion()`](#getsdkversion)
* [`isEnabled()`](#isenabled)
* [`enable(...)`](#enable)
* [`setCustomProperties(...)`](#setcustomproperties)
* [`getLogLevel()`](#getloglevel)
* [`setLogLevel(...)`](#setloglevel)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### getInstallId()

```typescript
getInstallId() => any
```

Returns AppCenter UUID.
For more info, please see: https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/cordova#identify-installations

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### setUserId(...)

```typescript
setUserId(options: { userId: string; }) => any
```

Set a user ID that's used to augment crash reports.
For more info, please see: https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/cordova#identify-users

| Param         | Type                             |
| ------------- | -------------------------------- |
| **`options`** | <code>{ userId: string; }</code> |

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### getSdkVersion()

```typescript
getSdkVersion() => any
```

Get the version of the native App Center SDK

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### isEnabled()

```typescript
isEnabled() => any
```

Check if App Center is enabled or not as a whole.

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### enable(...)

```typescript
enable(options: { enableFlag: boolean; }) => any
```

Toggle all App Center services at runtime. When disabled, the SDK won't forward any information to App Center.

| Param         | Type                                  |
| ------------- | ------------------------------------- |
| **`options`** | <code>{ enableFlag: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### setCustomProperties(...)

```typescript
setCustomProperties(options: { properties: CustomProperties; }) => any
```

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. 
For instance, you can use custom properties to segment your users, and then send push notifications to a specific audience.

| Param         | Type                                           |
| ------------- | ---------------------------------------------- |
| **`options`** | <code>{ properties: CustomProperties; }</code> |

**Returns:** <code>any</code>

**Since:** 0.2.0

--------------------


### getLogLevel()

```typescript
getLogLevel() => any
```

Returns currently set <a href="#loglevel">LogLevel</a>.

**Returns:** <code>any</code>

**Since:** 0.2.0

--------------------


### setLogLevel(...)

```typescript
setLogLevel(options: { logLevel: LogLevel; }) => any
```

You can control the amount of log messages that show up from App Center in the console. Log messages show in the console on iOS and LogCat on Android.
By default, it's set to Assert for the App Store environment and Warning otherwise. To have as many log messages as possible, use Verbose. 
Note: `setLogLevel` API can't increase logging for app startup code, before JavaScript is loaded.

| Param         | Type                                                         |
| ------------- | ------------------------------------------------------------ |
| **`options`** | <code>{ logLevel: <a href="#loglevel">LogLevel</a>; }</code> |

**Returns:** <code>any</code>

**Since:** 0.2.0

--------------------


### Enums


#### LogLevel

| Members       | Value           |
| ------------- | --------------- |
| **`VERBOSE`** | <code>2</code>  |
| **`DEBUG`**   | <code>3</code>  |
| **`INFO`**    | <code>4</code>  |
| **`WARNING`** | <code>5</code>  |
| **`ERROR`**   | <code>6</code>  |
| **`ASSERT`**  | <code>7</code>  |
| **`NONE`**    | <code>99</code> |

</docgen-api>
