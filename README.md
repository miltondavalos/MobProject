# MobProject
Command Line tool to create an automation project structure to test mobile applications. It relies on MobPage and MobManager Ruby gems

## Installation
gem install mobproject

## Usage
1. On your terminal navigate to the directory where you wish to store your automation project or create a new directory. E.g. *~/Projects/Automation*

2. On your terminal, inside your Automation project directory (created above) type: mobproject create <PROJECT_NAME>.
Replace <PROJECT_NAME> with your Automation Project Name and specify if it is a Mobile or Web project. E.g. 
mobproject create ClientXMobileTests. A predefined project structure will be created.

3. cd into your project (E.g. cd ClientXMobileTests) and type: 
*bundle install*
This command will install all your external dependencies as specified in the Gemfile including mobmanager and mobpage.

4. While using your preferred IDE navigate to features->support->settings in the project and edit either android.yml or ios.yml depending on the platform you are testing or both if you plan to work on both platforms.

5.  If you intend to run tests on Sauce, you must define SAUCE_USER and SAUCE_KEY as environment variables.  An example from bash
```
export SAUCE_USER=YOUR_USER
export SAUCE_KEY=39ba78a4-ac58-469b-a338-0115ac0rd090
```

6. Android settings:

To setup your android tests, uncomment and provide the below flags in android.yml.
Ask your android developer the package name and the launchable activity name.

``` ruby
#:apk: 'YOUR ANDROID APPLICATION PACKAGE'
#:apk_path: 'PATH TO YOUR ANDROID APK'
#:android_package: "YOUR APPLICATION'S PACKAGE NAME"
#:android_activity: "YOUR APPLICATION'S LAUNCHABLE ACTIVITY NAME"
```
Examples:
``` ruby
:apk: 'app-test-debug-unaligned.apk'
:apk_path: '/Users/mdavalos/Downloads/app-test-debug-unaligned.apk'
:android_package: 'com.test.news.kn'
:android_activity: 'com.mob.test.app.SplashActivity'
:apk: 'App-Debug-origin-feature-ordering-1.6.4.174.149.apk'
:apk_path: '/Users/mdavalos/Downloads/App-Debug-origin-feature-ordering-1.6.4.174.149.apk'
:android_package: 'com.mob.android.app'
:android_activity: 'com.mob.android.app.activities.SplashActivity'
```

**Run Android tests:**

Emulator or AVD (Android Virtual Device)
If you wish to run your tests on an Android emulator you need to create an AVD and register the avd name in your inventory.

To create an AVD follow instructions provided here: http://developer.android.com/tools/devices/managing-avds.html

To register your AVD navigate to features->support->mobile->platform->android->inventory->emulator.yml and add the newly create AVD name as shown below:

\- YOUR_AVD_NAME
Examples:
``` ruby
- nexus_5_lollipop
- galaxy_s6_lollipop
```
**Physical Devices:**

If you wish to run your tests on an Android physical devices you need to obtain your device UDID and register the physical devices in your inventory

**Prepare your device for development:**

Obtain UDID. Plug your device via USB and run: adb devices

To register your physical device navigate to features->support->mobile->platform->android->inventory->device.yml and provide a device name and UDID as shown below:

``` ruby
# <DEVICE_NAME>:<DEVICE ID>
# Give your devices a meaningful name. A name that could easily identify the device type and os
# The device name will be passed to a rake task(s) for execution.
# You can get your device id by plugging your device via USB and running the command 'adb devices' on your terminal.
# Your device may need to be setup for development.
```
Examples:
``` ruby
samsung_s5_kitkat_442: 102448dd
droid_maxx_kitkat_444: TA96106AQK
```
Example Rake Command to execute Android tests:

If you use zsh: rake android_device\['@mobtest','device:Nexus5'\]

If you use bash: rake android_device['@mobtest','device:Nexus5']

Note: Rake tasks can be executed from RubyMine Run menu
 
To run Android tests on sauce, use tag sauce_android_avd and an avd from features/support/mobile/platform/android/inventory/sauce.yml .  A bash example:
 
*rake sauce_android_avd['@mobtest','avd:galaxy_s4_4.3']*
 
7. iOS settings
 
To set up your ios tests, you may either have mobtest build your app or provide a path to a compiled app.  In either case, the app will need to be compiled to run on iOS simulators.  

To provide a path to a compiled app, uncomment the line defining app_path in ios.yml and provide a full path to the app:
 
``` ruby 
#======================================================================
#IF YOU WISH TO TEST YOUR OWN COMPILED IOS APP ON A SIMULATOR PROVIDE:
#======================================================================
#:app_path: 'PATH TO YOUR .APP FILE'
#E.G.:
:app_path: '/Users/cobrien/Library/Developer/Xcode/DerivedData/SpecialtyRx-g\
dpzgeltopfmfxffzlhtyujkjqp/Build/Products/Debug-iphonesimulator/SpecialtyRx\
.app'
 ```

**Run iOS tests:**

In bash, 
*rake ios_simulator['@mobtest','simulator:iphone_6_8.1']*

Note that the complete list of simulators is found in features/support/mobile/platform/ios/inventory/simulators.yml .
 
To run a test on sauce, use the target sauce_ios_simulator and one of the simulators listed in features/support/mobile/platform/ios/inventory/sauce.yml.  This will upload the app in ios.yml to sauce and run the tests.  

An example from bash:

*rake sauce_ios_simulator['@mobtest','simulator:iphone_6_8.3']*

## Write your first test

In this example we are creating a class to automate the Login page

``` ruby
class Login < MobTest::Base
 
   android do
    text_field(:username, id: 'android:id/username')
    text_field(:password, id: 'android:id/password')
    button(:submit, class: 'android.widget.RadioButton', text: 'submit')
    
    # android methods here
   end
 
   ios do
    text_field(:username, name: 'username')
    text_field(:password, xpath: '//UIAApplication[1]/UIAWindow[1]/UIATextField[2]')
    button(:submit, class: 'UIAButton', text: 'submit') 
 
    # ios methods here
   end
   web do
    text_field(:username, id: 'username')
    text_field(:password, id: 'password')
    button(:submit, class_name: 'loginButton') 
 
    # web methods here
   end

   # methods platform independent here
 end
 ```
 
In your step definitions (postfix your selectors with _element)

``` ruby
 on(Login).username_element.send_keys 'mobtest'
 on(Login).password_element.send_keys 'TopS3cre7'
 on(Login).submit_element.click
 ```
