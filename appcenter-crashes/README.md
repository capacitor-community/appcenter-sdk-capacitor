# @capacitor-community/appcenter-crashes

App Center Crashes records the state of the app and device and automatically generates a crash log.

## Install

```bash
npm install @capacitor-community/appcenter-crashes
npx cap sync
```

## API

<docgen-index>

* [`isEnabled()`](#isenabled)
* [`setEnable(...)`](#setenable)

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


### setEnable(...)

```typescript
setEnable(options: { shouldEnable: boolean; }) => any
```

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK won't do any crash reporting for the app.

| Param         | Type                                    |
| ------------- | --------------------------------------- |
| **`options`** | <code>{ shouldEnable: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.1.0

--------------------

</docgen-api>
