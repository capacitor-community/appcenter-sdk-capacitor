# App Center SDK for Capacitor

> ### :rotating_light: Project is in active development and not ready to be used. Check back later. :rotating_light:

App Center is mission control for mobile apps. Get faster release cycles, higher-quality apps, and the insights to build what users want.

## Plugins

The Capacitor App Center SDK consists of a several plugins so you can use any or all of the supported App Center services. This SDK uses a modular approach, where you just add the modules for App Center services that you want to use. `appcenter-analytics` and `appcenter-crashes` make sense to add to almost every app, as they provide value with no additional setup required. `appcenter` provides general purpose App Center APIs, useful for multiple services.

| Package | Source | Version |
| --- | --- | --- |
| [`@capacitor-community/appcenter`](https://capacitorjs.com/docs/v3/apis/action-sheet) | [`./appcenter`](./appcenter) | [![npm badge](https://img.shields.io/npm/v/@capacitor-community/appcenter?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter)
| [`@capacitor-community/appcenter-analytics`](https://capacitorjs.com/docs/v3/apis/appcenter-analytics) | [`./appcenter-analytics`](./appcenter-analytics) | [![npm badge](https://img.shields.io/npm/v/@capacitor-community/appcenter-analytics?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter-analytics)
| [`@capacitor-community/appcenter-crashes`](https://capacitorjs.com/docs/v3/apis/appcenter-crashes) | [`./appcenter-crashes`](./appcenter-crashes) | [![npm badge](https://img.shields.io/npm/v/@capacitor-community/appcenter-crashes?style=flat-square)](https://www.npmjs.com/package/@capacitor-community/appcenter-crashes)

## 📱 Example Mobile App

You can get familiar with SDK quickly by cloning this repository and running the sample app in `example` directory. For further instructions please refer to [example's README](example/README.md)

## 1. 📦 Installation

Add the App Center plugin(s) that fit your needs directly from the CLI:

```bash
npm i @capacitor-community/appcenter @capacitor-community/appcenter-analytics
npx cap sync
```

This will install two of the plugins available today.

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
    </dict>
</plist>
```

### Android

Coming Soon.