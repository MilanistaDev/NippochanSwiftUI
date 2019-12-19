# 勤怠ちゃん 〜Kintai-chan〜

## Overview of this app

This app is a Watch app using SwiftUI.   
You can post fixed words on Slack using Apple Watch.

![15_PostActivity.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/88266/8312deb7-ff7c-02d8-b25d-1a41b2e10c08.gif)

## Commentary article

This app is a sample app made for Qiita Advent Calendar 2019.  
The commentary is as follows. Written in Japanese.

[https://qiita.com/MilanistaDev/items/dbc4d2c2cc4522f12972](https://qiita.com/MilanistaDev/items/dbc4d2c2cc4522f12972)

## Support
* macOS Catalina 10.15.1 and later
* Xcode 11.2.1 and later
* watchOS 6.1.1 and later

> You need an iOS 13 or higher iPad or iPhone paired with your Apple Watch to input the information needed to post Slack.

## How to use

**1. Clone or download this project and build.**  
**2. Edit or Delete preset data.**  
![09_edit_and_delete.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/88266/d7531a9b-d1b1-5f9f-532b-10e563f55870.gif)  
**3. Open the Settings List Screen.**  
![10_Settings.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/88266/d22a582f-8c0e-44e4-aad4-a9355c617272.gif)  
**4. Input your activity and favorite emoji.**  
![11_Add_Activity.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/88266/06dbd214-f4af-a5b0-d309-5490c2f42a60.gif)  
**5. Input info for slack post**  
![12_Slack_Settings.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/88266/423baa96-0cbc-0eff-91a7-759e21e49162.gif)  
> On this screen, enter the information required when posting Slack and use it as a parameter when sending.
Similarly, text input is performed on the iOS 13 iOS device that is paired.
Enter Slack's Webhook URL and GitHub account name,
User name and favorite color code.
This information will be used when posting to Slack.
When the "?" Button is tapped, an explanation screen is displayed for each item in a modal manner.

Slack Webhook URL can be obtained from the following link.  
Set the icon and user name for Slack posting in this site.

[https://slack.com/services/new/incoming-webhook](https://slack.com/services/new/incoming-webhook)

**6. Slack post**

Finally, you can post Slack by tapping the cell on the top list screen.

![15_PostActivity.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/88266/8312deb7-ff7c-02d8-b25d-1a41b2e10c08.gif)

## Existing bugs and issues

### Bugs
* App crashes when you return to the list screen after editing the list activity.
* The initial value may not be updated even though you entered each item on the Slack settings screen and pressed the Save button.

### issues

* When entering the Webhook URL, you cannot copy and paste on the iPhone side, so you must enter each character.
* Code is bad...

## App update history

|App Version|Date|MEMO|
|:--:|:--:|:--|
|1.0.0|2019-12-20|v1.0.0 released.|

## Contact

Please feel free to contact us if you find a bug or have any feedback.  
Suggestions for adding functions and code corrections are also welcome.

```swift
let name = "Takuya Aso" 
let email = "milanista224" + "@" + "icloud.com"
let profession = "iOS Engineer"
let location = "Tokyo"
```
