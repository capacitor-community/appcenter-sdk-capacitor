# App Center SDK for Capacitor

> This project is currently in active development and is not ready to be used. Check back later.

App Center is mission control for mobile apps. Get faster release cycles, higher-quality apps, and the insights to build what users want.

The Capacitor App Center SDK consists of a several plugins so you can use any or all of the following services:

1. App Center Analytics: App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

2. App Center Crashes: App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

3. App Center Push: App Center Push enables you to send push notifications to users of your app from the App Center portal. We use APNs for iOS apps and FCM for Android. You can also segment your user base based on a set of properties and send them targeted notifications.

## Example application

You can get familiar with SDK quickly by cloning this repository and running sample app in `example` directory. For further instructions please refer to [example's README](example/README.md)