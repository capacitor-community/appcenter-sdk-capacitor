# appcenter-shared

Capacitor Plugin for Microsoft's Visual Studio App Center SDK.

## Install

```bash
npm install @capacitor-community/appcenter-shared
npx cap sync
```

## API

<docgen-index>

* [`getInstallId()`](#getinstallid)
* [`setUserId(...)`](#setuserid)
* [`getSdkVersion()`](#getsdkversion)
* [`isEnabled()`](#isenabled)
* [`enable(...)`](#enable)

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

Get the version of App Center SDK

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

Disable all services at runtime. When disabled, the SDK won't forward any information to App Center.

| Param         | Type                                  |
| ------------- | ------------------------------------- |
| **`options`** | <code>{ enableFlag: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------

</docgen-api>
