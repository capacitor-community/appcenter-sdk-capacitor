<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>

<h3 align="center">App Center Analytics</h3>
<p align="center"><strong><code>@capacitor-community/appcenter-analytics</code></strong></p>
<p align="center">
  App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2020?style=flat-square" />
  <a href="https://github.com/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter-analytics/actions?query=workflow%3A%22CI%22"><img src="https://img.shields.io/github/workflow/status/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter-analytics/CI?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-analytics"><img src="https://img.shields.io/npm/l/@capacitor-community/appcenter-analytics?style=flat-square" /></a>
  <br>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-analytics"><img src="https://img.shields.io/npm/dw/@capacitor-community/appcenter-analytics?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/appcenter-analytics"><img src="https://img.shields.io/npm/v/@capacitor-community/appcenter-analytics?style=flat-square" /></a>
  <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
  <a href="#contributors-"><img src="https://img.shields.io/badge/all%20contributors-0-orange?style=flat-square" /></a>
  <!-- ALL-CONTRIBUTORS-BADGE:END -->
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

* [`enable(...)`](#enable)
* [`isEnabled()`](#isenabled)
* [`pause()`](#pause)
* [`resume()`](#resume)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### enable(...)

```typescript
enable(options: { enableFlag: boolean; }) => any
```

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK won't collect any more analytics information for the app.

| Param         | Type                                  |
| ------------- | ------------------------------------- |
| **`options`** | <code>{ enableFlag: boolean; }</code> |

**Returns:** <code>any</code>

**Since:** 0.1.0

--------------------


### isEnabled()

```typescript
isEnabled() => any
```

Check if Analytics is enabled or not.

**Returns:** <code>any</code>

**Since:** 0.0.1

--------------------


### pause()

```typescript
pause() => any
```

Pause transmission of Analytics logs. While paused, Analytics logs are saved to disk.

**Returns:** <code>any</code>

**Since:** 0.1.0

--------------------


### resume()

```typescript
resume() => any
```

Resume transmission of Analytics logs. Any Analytics logs that accumulated on disk while paused are sent to the server.

**Returns:** <code>any</code>

**Since:** 0.1.0

--------------------

</docgen-api>