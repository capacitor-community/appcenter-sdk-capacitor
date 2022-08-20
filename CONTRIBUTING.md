# Contributing

This guide provides instructions for contributing to the various Capacitor plugins in this mono repo.

## Issues & Discussions

The repo uses GitHub [issues](https://github.com/capacitor-community/appcenter-sdk-capacitor/issues) and [discussions](https://github.com/capacitor-community/appcenter-sdk-capacitor/discussions) to track bugs and feature requests, as well as to provide a place for community questions, ideas, and discussions.

* **When to use [issues](https://github.com/capacitor-community/appcenter-sdk-capacitor/issues)**:
    * To report specific, reproducible bugs (see [Creating a Code Reproduction](#creating-a-code-reproduction)).
    * To propose detailed feature requests.
* **When to use [discussions](https://github.com/capacitor-community/appcenter-sdk-capacitor/discussions)**:
    * To ask for help.
    * To ask general questions.
    * To show off cool stuff.
    * To propose ideas for improvement.
    * If you think you found a bug, but may need help to further uncover it.
    * Anything else!

### Creating a Code Reproduction

When reporting bugs, we ask you to provide a minimal sample application that demonstrates the issue. Without a reliable code reproduction, it is unlikely we will be able to resolve the issue, leading to it being closed.

To create a code reproduction:

* Create a new application using `npm init @capacitor/app` (or `ionic start --capacitor`).
* Add the minimum amount of code necessary to recreate the issue you're experiencing.
* Push the code reproduction to a public GitHub repository and include a link when you create a bug report.
* Be sure to include steps to reproduce the issue.

## Developing

### Directory Structure

This monorepo contains various core App Center components and one shared lib. The current directory structure looks like this:

* `appcenter`: Appcenter Capacitor Plugin
* `appcenter-analytics`: Analytics Capacitor Plugin
* `appcenter-crashes`: Crashes Capacitor Plugin
* `AppCenterCapacitorShared`: Shared libary which setups the core SDK and other shared functions.
* `example`: Example Capacitor app acting as the kitchen sink example for all plugin features.

### Local Setup

1. Fork and clone the repo.
1. Install the dependencies.

    ```shell
    npm install
    ```

1. Install SwiftLint if you're on macOS.

    ```shell
    brew install swiftlint
    ```

### Scripts

The following commands can be run globally or withing each plugin.

#### `npm run lint`
Lint all the plugin web assets.

#### `npm run fmt`
Formats the codebase after linting.

#### `npm run build`
Builds the JS assets and docgen.

#### `npm run verify`
Builds native projects.

#### `npm run verify:ios`
Builds iOS project.

#### `npm run verify:android`
Builds Android project.

### Example App
This repo includes an example capacitor app which implements all of the plugins. By default it uses the latest minor release of the plugins from npm. When testing locally it can be helpful to have example app point to your local plugin rather than the one from npm. To do this add the plugin via lerna:

Run this command from within `/example` dir.

```bash
# Adds @capacitor-community/appcenter to example app
lerna add @capacitor-community/appcenter --scope=example
```
