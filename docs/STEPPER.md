# **Stepper Models Explanations**
## **What is Stepper ?**

Stepper is an application where employee can track their progress of skills base on some standards (areas) to adjust and grow their skills. A long side with that, employments can manage each of employee’s progress

## **Domain Knowledge**

These are some keywords you should understand

**Professions:** Professions are employee’s major that they're working on. For now, there are 3 main professions

- **Engineer**
- **Tech Lead**
- **QA**

**Bands:** Band is level of seniority of professions (meaning that each professions have its level 1,2,3, etc). More over, each band has its **Areas** (mentioned below) following

Ex: Engineer | Band 1 | Areas: S1, S2, S3, E1, E2, E3, M1, M2, M3

 **⇒ Profession: Engineer | Level: 1 | Level 1 contains areas:**  S1, S2, S3, E1, E2, E3, M1, M2, M3

**Areas:** Areas are some standards | skills which employees base on and rate it, keep track then level up the skills

Currently, there area 3 types of areas: 
  - Scope
  - Expertise
  - Mindset

# **Breaking changes**
There is a breaking change from version 2.0.x to version 3.0.0 that you should aware while contribute to Stepper.

### **Firebase Model Problem**
- There are several problems with firestore model that needs to be refactored the whole models of the app
[Read this](https://gaudy-cut-4f0.notion.site/Firebase-Modeling-Problem-8c94752f87674e6a896a130763ae9586)

### **Migrating to Github Actions and Fastlane**
Although CodeMagic is good, it still has limitations on number of builds, while Github actions gives us free builds for public project

[Read this](https://gaudy-cut-4f0.notion.site/How-I-use-Fastlane-and-Github-actions-to-save-my-time-my-life-also-9ea1ff4647b54cf184c3378b19edbb43)  

For now, we still depends on CodeMagic to release our updates. However this process needs to be replaced by Github actions and Fastlane

For testing purpose, we can use Github actions and Fastlane to distribute app for testing. (iOS only, Android is not implemented yet)

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