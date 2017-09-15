# rollbar-react-native

## Getting started

`$ npm install rollbar-react-native --save`

### Mostly automatic installation

`$ react-native link rollbar-react-native`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `rollbar-react-native` and add `RollbarReactNative.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRollbarReactNative.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.rollbar.RollbarReactNativePackage;` to the imports at the top of the file
  - Add `new RollbarReactNativePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':rollbar-react-native'
  	project(':rollbar-react-native').projectDir = new File(rootProject.projectDir, 	'../node_modules/rollbar-react-native/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':rollbar-react-native')
  	```


## Usage
```javascript
import RollbarReactNative from 'rollbar-react-native';

// TODO: What to do with the module?
RollbarReactNative;
```
  
