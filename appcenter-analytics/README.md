<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>

<h3 align="center">App Center Analytics</h3>
<p align="center"><strong><code>@capacitor-community/appcenter-analytics</code></strong></p>
<p align="center">
  App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.
</p>

<p align="center">
  <br>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-analytics"><img src="https://img.shields.io/npm/v/@capacitor-community/appcenter-analytics?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-analytics"><img src="https://img.shields.io/npm/dw/@capacitor-community/appcenter-analytics?style=flat-square" /></a>
</p>

## Maintainers

| Maintainer | GitHub | Social |
| -----------| -------| -------|
| John Borges | [johnborges](https://github.com/johnborges) | [@johnborges](https://twitter.com/johnborges) |

## Install

```bash
npm install @capacitor-community/appcenter-analytics
npx cap sync
```

## Session and Device Info
Once you add App Center Analytics to your app and the SDK is started, it will automatically track sessions and device properties like OS Version, model, etc. You don’t need to write any additional code.

## Usage

## API

<docgen-index>

* [`setEnabled(...)`](#setenabled)
* [`isEnabled()`](#isenabled)
* [`pause()`](#pause)
* [`resume()`](#resume)
* [`trackEvent(...)`](#trackevent)
* [`enableManualSessionTracker()`](#enablemanualsessiontracker)
* [`startSession()`](#startsession)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### setEnabled(...)

```typescript
setEnabled(options: { enable: boolean; }) => Promise<void>
```

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK won't collect any more analytics information for the app.

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ enable: boolean; }</code> |

**Since:** 0.3.0

--------------------


### isEnabled()

```typescript
isEnabled() => Promise<{ value: boolean; }>
```

Check if Analytics is enabled or not.

**Returns:** <code>Promise&lt;{ value: boolean; }&gt;</code>

**Since:** 0.0.1

--------------------


### pause()

```typescript
pause() => Promise<void>
```

Pause transmission of Analytics logs. While paused, Analytics logs are saved to disk.

**Since:** 0.1.0

--------------------


### resume()

```typescript
resume() => Promise<void>
```

Resume transmission of Analytics logs. Any Analytics logs that accumulated on disk while paused are sent to the server.

**Since:** 0.1.0

--------------------


### trackEvent(...)

```typescript
trackEvent(options: AnalyticsEvent) => Promise<void>
```

Track an event with optional custom properties to know what's happening in your app, understand user actions, and see the aggregates in the App Center portal.

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#analyticsevent">AnalyticsEvent</a></code> |

**Since:** 0.1.0

--------------------


### enableManualSessionTracker()

```typescript
enableManualSessionTracker() => Promise<void>
```

Enable manual session tracker. Call this method before Analytics starts.

**Since:** 2.0.0

--------------------


### startSession()

```typescript
startSession() => Promise<void>
```

Start a new session if manual session tracker is enabled, otherwise do nothing.

**Since:** 2.0.0

--------------------


### Interfaces


#### AnalyticsEvent

| Prop             | Type                                    | Description                          |
| ---------------- | --------------------------------------- | ------------------------------------ |
| **`name`**       | <code>string</code>                     | 256 character limit                  |
| **`properties`** | <code>{ [key: string]: string; }</code> | Only 20 properties allowed per event |
| **`flag`**       | <code>'normal' \| 'critical'</code>     |                                      |

</docgen-api>
