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

</docgen-api>
