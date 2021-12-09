# Stepper

Flutter project for level up employees (engineers, designers, etc) in CoderPush.

## Development setup

To run the project, here are the steps:

- Install Flutter on your local machine: https://flutter.dev/docs/get-started/install

  - For iOS users, make sure you have install Xcode to create an iOS simulator:
  https://www.apple.com/app-store/

  - For Android users, make sure you have install Android Studio to create an Android emulator:
  https://developer.android.com/studio

- Install VsCode (optional for Android user): https://code.visualstudio.com/download

- Run command in your project terminal to fetch all dependencies:

  ```dart
  flutter pub get
  ```

- Open the project in VsCode (or Android Studio), click Run tab -> Start Debugging (make sure you have your simulator on)

## Release a new version of Stepper (both Android and iOS) (update with Codemagic)

When release a new version of the app, please follow these steps:

- In pubspec.yaml file, increase the `version` number, both `versionName` and `versionCode`:

  For example: current `version` is "1.0.0+1" --> new release `version` is "1.0.1+2" --> next release will be "1.0.2+3"

- Merge new change to "main" branch

- Merge "main" branch to "prod" branch, this will trigger auto-deployment in Codemagic

- Login to Codemagic with email stepper@coderpush.com and wait for newly-triggered workflow to finish

- **For Android**:
  + check in google play console new release version has been published

+ **For iOS**:
  + create new release
  + choose the new app version which has been published by Codemagic
  + fill in other information (release note, etc) then submit