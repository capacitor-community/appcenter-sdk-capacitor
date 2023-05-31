# @capacitor-community/appcenter-distribute

Capacitor Plugin for Microsoft's App Center Distribute SDK.

## Install

```bash
npm install @capacitor-community/appcenter-distribute
npx cap sync
```

## API

<docgen-index>

* [`checkForUpdate()`](#checkforupdate)
* [`setEnabled(...)`](#setenabled)
* [`isEnabled()`](#isenabled)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### checkForUpdate()

```typescript
checkForUpdate() => Promise<void>
```

Sends a request to App Center and displays an update dialog in case there's a new release available. Note: A manual check for update call works even when automatic updates are enabled. 
A manual check for update is ignored if another check is already being done. The manual check for update won't be processed if the user has postponed updates (unless the latest version is a mandatory update).

**Since:** 1.0.0

--------------------


### setEnabled(...)

```typescript
setEnabled(options: { enable: boolean; }) => Promise<void>
```

You can enable and disable App Center Distribute at runtime. If you disable it, the SDK won't provide any in-app update functionality but you can still use Distribute service in App Center portal.

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ enable: boolean; }</code> |

**Since:** 1.0.0

--------------------


### isEnabled()

```typescript
isEnabled() => Promise<{ value: boolean; }>
```

Check if Distribute is enabled or not.

**Returns:** <code>Promise&lt;{ value: boolean; }&gt;</code>

**Since:** 1.0.0

--------------------

</docgen-api>
