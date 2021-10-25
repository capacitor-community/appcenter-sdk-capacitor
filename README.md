# App Center SDK for Capacitor

App Center is mission control for mobile apps. Get faster release cycles, higher-quality apps, and the insights to build what users want.

## Plugins

The Capacitor App Center SDK consists of a several plugins so you can use any or all of the supported App Center services. This SDK uses a modular approach, where you just add the modules for App Center services that you want to use. `appcenter-analytics` and `appcenter-crashes` make sense to add to almost every app, as they provide value with no additional setup required. `appcenter` provides general purpose App Center APIs, useful for multiple services.

| Package | Source | Version | Downloads |
| --- | --- | --- | --- |
| `@capacitor-community/appcenter` | [`./appcenter`](https://github.com/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter) | [![npm badge](https://img.shields.io/npm/v/@capacitor-community/appcenter?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter) | [![npm badge](https://img.shields.io/npm/dw/@capacitor-community/appcenter?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter)
| `@capacitor-community/appcenter-analytics` | [`./appcenter-analytics`](https://github.com/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter-analytics) | [![npm badge](https://img.shields.io/npm/v/@capacitor-community/appcenter-analytics?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter-analytics) | [![npm badge](https://img.shields.io/npm/dw/@capacitor-community/appcenter-analytics?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter-analytics)
| `@capacitor-community/appcenter-crashes` | [`./appcenter-crashes`](https://github.com/capacitor-community/appcenter-sdk-capacitor/tree/master/appcenter-crashes) | [![npm badge](https://img.shields.io/npm/v/@capacitor-community/appcenter-crashes?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter-crashes) | [![npm badge](https://img.shields.io/npm/dw/@capacitor-community/appcenter-crashes?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter-crashes)

## 📱 Example Mobile App

You can get familiar with SDK quickly by cloning this repository and running the sample app in `example` directory. For further instructions please refer to [example's README](example/README.md)

## 1. 📦 Installation

Add the App Center plugin(s) that fit your needs directly from the CLI:

```bash
npm i @capacitor-community/appcenter @capacitor-community/appcenter-analytics @capacitor-community/appcenter-crashes --save-exact
npx cap sync
```

## 2. 🛠 Configure the SDK

You must configure the project with your App Center project app secret before you can use the App Center SDK in your Capacitor project. There are other values that can also be added, but they are optional.

> Notice that it's likely that Android and iOS platforms will be associated with different applications on App Center portal so you would need to add the APP_SECRET twice - one for Android and another for iOS.

### iOS

Create a new file with the name `AppCenter-Config.plist` with the following content and replace `{APP_SECRET_VALUE}` with your app secret value. Don't forget to add this file to the Xcode project (right-click the app in Xcode and click Add files to ...).

Example:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>AppSecret</key>
    <string>{APP_SECRET_VALUE}</string>
    <!-- below are optional -->
    <key>LogLevel</key>
    <integer>2</integer>
    <key>AnalyticsEnableInJs</key>
    <false/>
    <key>AnalyticsTransmissionInterval</key>
    <integer>3</integer>
    <key>CrashesEnableInJs</key>
    <false/>
    <key>CrashesAlwaysSend</key>
    <false/>
</dict>
</plist>
```

### Android

Create a new file with the name `appcenter-config.json` in `android/app/src/main/assets/` with the following content and replace {APP_SECRET_VALUE} with your app secret value.

```json
{
    "app_secret": "{APP_SECRET_VALUE}",
    "start_automatically": true
}
```
## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="http://johnborg.es"><img src="https://avatars.githubusercontent.com/u/1888122?v=4?s=100" width="100px;" alt=""/><br /><sub><b>John Borges</b></sub></a><br /><a href="https://github.com/capacitor-community/appcenter-sdk-capacitor/commits?author=johnborges" title="Code">💻</a></td>
    <td align="center"><a href="https://hrafnkellbaldurs.com/"><img src="https://avatars.githubusercontent.com/u/5609118?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Hrafnkell Baldursson</b></sub></a><br /><a href="https://github.com/capacitor-community/appcenter-sdk-capacitor/commits?author=hrafnkellbaldurs" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
