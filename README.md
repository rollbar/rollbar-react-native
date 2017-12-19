# ALPHA RELEASE

This library is currently under heavy development, however it should be usable
and therefore please [file an issue](https://github.com/rollbar/rollbar-react-native/issues)
if you have any problems working with this library.

# rollbar-react-native

## Getting started

`$ npm install rollbar-react-native --save`

### Mostly automatic installation

`$ react-native link rollbar-react-native`

If you are using Cocoapods, then you need to add the following to your pod file:

```
pod 'React', path: '../node_modules/react-native'
pod 'RollbarReactNative', path: '../node_modules/rollbar-react-native/ios'
```

and depending on your version of React Native, you will also need:

```
pod 'yoga', path: '../node_modules/react-native/ReactCommon/yoga'
```

Then perform a `pod install`.

You also need to ensure the static library is linked with your app in the generated workspace like
all other Cocoapods dependencies.

### Without Cocoapods

You will need to open your xcodeproj in XCode and follow these instructions:
https://github.com/rollbar/rollbar-ios#without-cocoapods to integrate the rollbar-ios
Framework with your project.

## Configuration

### Javascript

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

#### Source maps

Mapping production React Native javascript code to your source files is slightly more
complicated than traditional javascript environments. This is due to the fact that iOS and Android
generate different javascript bundles and hence different stack traces which need separate
source maps.

We can enable source maps to correctly identify the environment by using the `code_version` to signal
which source map to use.

```js
new Configuration('POST_CLIENT_ITEM_ACCESS_TOKEN', {
  ...
  payload: {
    client: {
      javascript: {
        source_map_enabled: true,
        code_version: 'insert_code_version_here.ios',
      }
    }
  }
});
```

Then specify the version when you upload the sourcemap via whatever mechanism you currently use. For
example, via curl:

```
curl https://api.rollbar.com/api/1/sourcemap \
  -F access_token=ACCESS_TOKEN_HERE \
  -F version=insert_code_version_here.ios \
  -F minified_url=http://reactnativehost/main.jsbundle \
  -F source_map=@sourcemap.ios.js \
  -F index.ios.js=@index.ios.js
```

Source maps work based on file names for mapping minified symbols to symbols contained in your
original source code. Due to the nature of the javascript environment that your code runs in on a
mobile device using React Native, those file names are a bit strange. We automatically rewrite these
file names to be `http://reactnativehost/<regular file path>`. This allows you to use the
`minified_url` with the fake protocol and host of `http://reactnativehost` to specify your minified
javascript code.

Furthermore, generating stack traces for React Native seems to be an under documented part of the
pipeline. Below are the commands one can run for generating conforming source maps for iOS and
Android, respectively.

```
react-native bundle --platform ios --entry-file index.ios.js --dev false --bundle-output
ios/main.jsbundle --assets-dest ios --sourcemap-output sourcemap.ios.js --sourcemap-sources-root ./
```

```
react-native bundle --platform android --dev false --entry-file index.android.js --bundle-output
android/index.android.bundle --assets-dest android/app/src/main/res/ --sourcemap-output
sourcemap.android.js --sourcemap-sources-root ./
```

### iOS

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

### Android

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
