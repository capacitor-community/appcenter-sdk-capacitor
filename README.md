# App Center SDK for Capacitor

> 🚧  This project is currently in active development and is not ready to be used. Check back later.

App Center is mission control for mobile apps. Get faster release cycles, higher-quality apps, and the insights to build what users want.

The Capacitor App Center SDK consists of a several plugins so you can use any or all of the following services:

1. App Center Analytics: App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

2. App Center Crashes: App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

3. App Center Shared: Contains additional APIs suitable for some projects: 
> `@capacitor-community/appcenter-shared` is used as a dependancy for the other App Center plugins and does not need to be installed manually.
- Adjusting the Log Level
- Identify Users and Instalations
- Control SDK Services
- Custom Properties

## Example application

You can get familiar with SDK quickly by cloning this repository and running sample app in `example` directory. For further instructions please refer to [example's README](example/README.md)

## 1. Installation

Add the App Center plugin(s) that fit your needs directly from the CLI:

```bash
npm i @capacitor-community/appcenter-analytics @capacitor-community/appcenter-crashes 
npx cap sync
```

This will install both of the plugins available today.

## 2. Link the SDK

To get it working in your app you will need to add some configuration values to your app configuration in `capacitor.config.json` file. See list of available parameters below

- `APP_SECRET` - _(required)_ App secret which enables App Center to map this app to the right user account

Example:

```json
{
  ...
  "plugins": {
    "AppCenterPlugin": {
      "IOS_APP_SECRET": "0000-0000-0000-0000-000000000000",
      "ANDROID_APP_SECRET": "0000-0000-0000-0000-000000000000"
    }
  }
}
```

Notice that it's likely that Android and iOS platforms will be associated with different applications on App Center portal so you would need to add this preference twice - one for Android (as in example above) and another for iOS.

## 3. Configure Preferences
Coming Soon...