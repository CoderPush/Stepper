# **Stepper**

Flutter open-source project for level up employees (engineers, designers, etc). Any company can use this application for assessing their employees, keeping employees' progress updated and provide a way to visualize their performance.

## **Getting Started**

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment section for notes on how to deploy the project on a live system.

### **Development setup**

To run the project, here are the steps:

- Install Flutter on your local machine: https://flutter.dev/docs/get-started/install

  - For iOS users, make sure you have install Xcode to create an iOS simulator:
  https://www.apple.com/app-store/

  - For Android users, make sure you have install Android Studio to create an Android emulator:
  https://developer.android.com/studio

  - For running on web, make sure you follow the [Firebase setup](#firebase-setup) section (for web) to add **firebaseConfig** before running the application on web

- Install VsCode (optional for running only on Android): https://code.visualstudio.com/download

- Run command in your project terminal to fetch all dependencies:

  ```dart
  flutter pub get
  ```

- Open the project in VsCode (or Android Studio), click Run tab -> Start Debugging (make sure you have chosen an Android/iOS simulator or Chrome (for web) for targeted device).

### **Firebase setup**

- Stepper's back-end utilizes Firebase authentication for registering/signing in users, Firestore for  storing user's data, and Firebase storage for saving user's uploading images.

- Please follow this guide to add Firebase to your local project:
  - For iOS: https://firebase.google.com/docs/flutter/setup?platform=ios. <br>
    Remember to download and copy *GoogleService-Info.plist* file into *iOS/Runner* folder, and add it to the Runner target in Xcode.
  - For Android: https://firebase.google.com/docs/flutter/setup?platform=android. <br>
    Remember to download and copy *google-services.json* file into *android/app* folder.
  - For web: https://firebase.google.com/docs/web/setup. <br>
    In index.html file, **firebaseConfig** const has to be replaced with your project specific config:

  ```html
    const firebaseConfig = {
      apiKey: "XXXXX",
      authDomain: "XXXXX",
      projectId: "XXXXX",
      storageBucket: "XXXXX",
      messagingSenderId: "XXXXX",
      appId: "XXXXX",
      measurementId: "XXXXX"
    };
  ```

## **Auto-release with CodeMagic**

Stepper is using [CodeMagic](https://flutterci.com/), a tool supports Flutter applications continuous integration and delivery, to automate releasing process, both for Android and iOS platforms.

If you want to set up your own workflow for automating release process, please refer to this documentation for more info: https://docs.codemagic.io/flutter-configuration/flutter-projects/. In this document, there are instructions on how to setup workflow for building Android app bundles and iOS ipa (providing code signing), so that CodeMagic will auto-trigger a workflow and release your new app version to Google Play/App store.

## **CMS tool with ROWY**

[Rowy](https://www.rowy.io/) tool is used to display Stepper's Firestore data in the most intuitive, simple way. With Firebase setup already for Stepper, user's entries will be perfectly visualized in Rowy tables, and any modification in Rowy will affect directly to Stepper's Firestore data.

To setup Rowy for your own project, please follow this document: https://docs.rowy.io/ (recommend quick deployment option) or follow these steps:

- Make sure you have setup Firebase for Stepper as [here](#firebase-setup)
- Navigate to https://github.com/rowyio/rowy, click "Run on Google Cloud" button (quick deploy)
- Trust Rowy repo, open and authorize Google cloud shell
- Choose your project in the list of available projects in your GCP account
- Choose region to deploy and let cloud console to finish the set up
- At the end of the setup, remember to sign in with the admin account to start creating tables, by clicking to the link in the image below:
![image](https://i.ibb.co/hV0C2YN/setup.png)

## **Application demo**

Sign up / Sign in:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Post options:

<a href="https://imgflip.com/gif/5z7wjh"><img src="https://i.imgflip.com/5z7wjh.gif" title="Sign in/ Register"/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://imgflip.com/gif/5z7x7c
"><img src="https://i.imgflip.com/5z7x7c.gif" title="Post options"/></a>

Create new post:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Edit post:

<a href="https://imgflip.com/gif/5z7xeg
"><img src="https://i.imgflip.com/5z7xeg.gif" title="Create new post"/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://imgflip.com/gif/5z7xls
"><img src="https://i.imgflip.com/5z7xls.gif" title="Edit post"/></a>

Area screen:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
User profile:

<a href="https://imgflip.com/gif/5z7xx8
"><img src="https://i.imgflip.com/5z7xx8.gif" title="Edit post"/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://imgflip.com/gif/5z7y68
"><img src="https://i.imgflip.com/5z7y68.gif" title="Edit post"/></a>

Log out:

<a href="https://imgflip.com/gif/5z7y9m
"><img src="https://i.imgflip.com/5z7y9m.gif" title="Edit post"/></a>

## **Internal development**
Regarding internal development for Stepper, please refer to [STEPPER.md](./docs/STEPPER.md) for more info.

## **Contributors**
Many thanks to the contributors:
- Harley Trung: harley@coderpush.com
- Long Vu: long@coderpush.com
- Hung Nguyen: harrison@coderpush.com
- Tien Le: tien@coderpush.com
- Kim Long: kimlong@coderpush.com

## License
This project is licensed under the GNU License - see the [LICENSE.md](docs/LICENSE.md) file for details