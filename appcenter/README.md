<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>

<h3 align="center">App Center</h3>
<p align="center"><strong><code>@capacitor-community/appcenter</code></strong></p>
<p align="center">
  Capacitor Plugin for Microsoft's Visual Studio App Center SDK. Contains additional helper APIs suitable for some projects.
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter"><img src="https://img.shields.io/npm/v/@capacitor-community/appcenter?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter"><img src="https://img.shields.io/npm/dw/@capacitor-community/appcenter?style=flat-square" /></a>
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

## Usage

```typescript
import AppCenter from '@capacitor-community/appcenter';

const appCenterInfo = async () => {

  try {
    const { value: sdkEnabled } = await AppCenter.isEnabled()
    const { value: installId } = await AppCenter.getInstallId()
    const { value: sdkVersion } = await AppCenter.getSdkVersion()
    const { value: logLevel } = await AppCenter.getLogLevel()

    console.debug(sdkEnabled);
    console.debug(installId);
    console.debug(sdkVersion);
    console.debug(logLevel);
  } 
  catch (error) {
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
* [`setEnabled(...)`](#setenabled)
* [`setCustomProperties(...)`](#setcustomproperties)
* [`getLogLevel()`](#getloglevel)
* [`setLogLevel(...)`](#setloglevel)
* [`setNetworkRequestsAllowed(...)`](#setnetworkrequestsallowed)
* [`isNetworkRequestsAllowed()`](#isnetworkrequestsallowed)
* [`setCountryCode(...)`](#setcountrycode)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### getInstallId()

```typescript
getInstallId() => any
```

Returns AppCenter unique installation identifier.

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### setUserId(...)

```typescript
setUserId(options: { userId: string; }) => any
```

Set a user ID that's used to augment crash reports.

| Param         | Type                             | Description        |
| ------------- | -------------------------------- | ------------------ |
| **`options`** | <code>{ userId: string; }</code> | Ex. "your-user-id" |

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


### setEnabled(...)

```typescript
setEnabled(options: { enabled: boolean; }) => any
```

Toggle all App Center services at runtime. When disabled, the SDK won't forward any information to App Center.

| Param         | Type                               |
| ------------- | ---------------------------------- |
| **`options`** | <code>{ enabled: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.7.0

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

**Since:** 2.0.0

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


### setNetworkRequestsAllowed(...)

```typescript
setNetworkRequestsAllowed(options?: { isAllowed: boolean; } | undefined) => any
```

Set whether SDK can send network requests.

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ isAllowed: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.6.0

--------------------


### isNetworkRequestsAllowed()

```typescript
isNetworkRequestsAllowed() => any
```

Check whether sending data in the App Center SDK is allowed or not.

**Returns:** <code>any</code>

**Since:** 0.6.0

--------------------


### setCountryCode(...)

```typescript
setCountryCode(options: { countryCode: string; }) => any
```

Set the two-letter ISO country code. Android only

| Param         | Type                                  | Description                                                                                                            |
| ------------- | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ countryCode: string; }</code> | the two-letter ISO country code. See &lt;code&gt;https://www.iso.org/obp/ui/#search&lt;/code&gt; for more information. |

**Returns:** <code>any</code>

**Since:** 2.0.0

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
