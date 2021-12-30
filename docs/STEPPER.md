## **Auto-release with CodeMagic**

Current for Stepper, when release a new version of the app, please follow these steps:

- In pubspec.yaml file, increase the `version` number, both `versionName` and `versionCode`:

  For example: current `version` is "1.0.0+1" --> new release `version` is "1.0.1+2" --> next release will be "1.0.2+3"

- Merge new change to "main" branch

- Merge "main" branch to "prod" branch, this will trigger auto-deployment workflow in Codemagic

- Login to Codemagic with email stepper@coderpush.com and wait for newly-triggered workflow to finish

- **For Android**:
  + check in google play console new release version has been published

+ **For iOS**:
  + create new release
  + choose the new app version which has been published by Codemagic
  + fill in other information (release note, etc) then submit

## **CMS tool with ROWY**

With current Stepper, Rowy is set up at https://stepper-577e8.rowy.app/. Please contact email stepper@coderpush.com or our Contributors to have access to this environment.