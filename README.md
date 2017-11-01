# ALPHA RELEASE

This library is currently under heavy development, however it should be usable
and therefore please [file an issue][https://github.com/rollbar/rollbar-react-native/issues]
if you have any problems working with this library.

# rollbar-react-native

## Getting started

`$ npm install rollbar-react-native --save`

### Mostly automatic installation

`$ react-native link rollbar-react-native`

If you are using Cocoapods, then you should only need to do a `pod install` to
get the iOS dependencies added to your workspace.

### Without Cocoapods

You will need to open your xcodeproj in XCode and follow these instructions:
https://github.com/rollbar/rollbar-ios#without-cocoapods to integrate the rollbar-ios
Framework with your project.

### Configuration

#### Javascript

In both `index.ios.js` and `index.android.js` you need to instantiate a Rollbar Client:

```js
import { Client } from 'rollbar-react-native'
const rollbar = new Client('POST_CLIENT_ITEM_ACCESS_TOKEN');
```

For more configuration options, construct an instance of the `Configuration` class:

```js
import { Client, Configuration } from 'rollbar-react-native'
const config = new Configuration('POST_CLIENT_ITEM_ACCESS_TOKEN', {
  endpoint: 'https://api.rollbar.com/api/1/item/',
  logLevel: 'info'
});
const rollbar = new Client(config);
```

The Configuration class is still a work in progress, but should eventually capture all of the
configuration options available for https://github.com/rollbar/rollbar.js/

The Javascript API consists of the logging methods:

```js
rollbar.log(error|message, extra, callback)
rollbar.debug(error|message, extra, callback)
rollbar.info(error|message, extra, callback)
rollbar.warning(error|message, extra, callback)
rollbar.error(error|message, extra, callback)
rollbar.critical(error|message, extra, callback)
```

As well as two methods for dealing with identifying users:

```js
rollbar.setPerson(id, name, email)
rollbar.clearPerson()
```

#### iOS

In `AppDelegate.m` you need to import `RollbarReactNative`

```objc
#import <RollbarReactNative/RollbarReactNative.h>
```

and initialize it

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
  [RollbarReactNative initWithAccessToken:@"POST_CLIENT_ITEM_ACCESS_TOKEN"];
  ...
}
```

The interface for `RollbarReactNative` in native iOS code is the same as
https://github.com/rollbar/rollbar-ios. Crashes in native code will be reported automatically on the
next app launch.

#### Android

We require minSdkVersion of at least 19 be set in your app/build.gradle file.

In `MainApplication.java` you need to import `RollbarReactNative`

```java
import com.rollbar.RollbarReactNative;
```

and initialize it

```java
@Override
public void onCreate() {
  super.onCreate();
  RollbarReactNative.init(this, "POST_CLIENT_ITEM_ACCESS_TOKEN", "production");
  ...
}
```

The interface for `RollbarReactNative` in native Android code is the same as the rollbar-android
part of https://github.com/rollbar/rollbar-java. Crashes in native code will be reported
automatically on the next app launch.
