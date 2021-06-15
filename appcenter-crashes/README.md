# @capacitor-community/appcenter-crashes

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

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
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### isEnabled()

```typescript
isEnabled() => any
```

Check if Crashes is enabled or not.

**Returns:** <code>any</code>

**Since:** 0.1.0

--------------------


### setEnabled(...)

```typescript
setEnabled(options: { shouldEnable: boolean; }) => any
```

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK won't do any crash reporting for the app.
The state is persisted in the device's storage across application launches.

| Param         | Type                                    |
| ------------- | --------------------------------------- |
| **`options`** | <code>{ shouldEnable: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.1.0

--------------------


### generateTestCrash()

```typescript
generateTestCrash() => any
```

Generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

**Returns:** <code>any</code>

**Since:** 0.2.0

--------------------


### hasReceivedMemoryWarningInLastSession()

```typescript
hasReceivedMemoryWarningInLastSession() => any
```

Check if app recieved memory warning in the last session.

**Returns:** <code>any</code>

**Since:** 0.2.0

--------------------


### hasCrashedInLastSession()

```typescript
hasCrashedInLastSession() => any
```

Check if the app has crashed in the last session.

**Returns:** <code>any</code>

**Since:** 0.3.0

--------------------


### lastSessionCrashReport()

```typescript
lastSessionCrashReport() => any
```

Provides details about the crash that occurred in the last app session.

**Returns:** <code>any</code>

**Since:** 0.3.0

--------------------


### Interfaces


#### ErrorReport

| Prop                       | Type                                      |
| -------------------------- | ----------------------------------------- |
| **`id`**                   | <code>string</code>                       |
| **`threadName`**           | <code>string</code>                       |
| **`appErrorTime`**         | <code>string \| number</code>             |
| **`appStartTime`**         | <code>string \| number</code>             |
| **`exceptionName`**        | <code>string</code>                       |
| **`exceptionReason`**      | <code>string</code>                       |
| **`device`**               | <code><a href="#device">Device</a></code> |
| **`signal`**               | <code>string</code>                       |
| **`appProcessIdentifier`** | <code>number</code>                       |


#### Device

| Prop                 | Type                |
| -------------------- | ------------------- |
| **`sdkName`**        | <code>string</code> |
| **`sdkVersion`**     | <code>string</code> |
| **`model`**          | <code>string</code> |
| **`oemName`**        | <code>string</code> |
| **`osName`**         | <code>string</code> |
| **`osVersion`**      | <code>string</code> |
| **`osBuild`**        | <code>string</code> |
| **`osApiLevel`**     | <code>number</code> |
| **`locale`**         | <code>string</code> |
| **`timeZoneOffset`** | <code>number</code> |
| **`screenSize`**     | <code>string</code> |
| **`appVersion`**     | <code>string</code> |
| **`carrierName`**    | <code>string</code> |
| **`carrierCountry`** | <code>string</code> |
| **`appBuild`**       | <code>string</code> |
| **`appNamespace`**   | <code>string</code> |

</docgen-api>
