package com.rollbar;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ViewManager;
import com.facebook.react.bridge.JavaScriptModule;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import android.content.Context;

import com.rollbar.android.*;

public class RollbarReactNative extends ReactContextBaseJavaModule {
  private ReactContext reactContext;

  public static ReactPackage getPackage() {
    return new RollbarReactNativePackage();
  }

  public RollbarReactNative(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  public static void start(Context context, String accessToken, String environment) {
    Rollbar.init(context, accessToken, environment);
  }

  @Override
  public String getName() {
    return "RollbarReactNative";
  }

  @ReactMethod
  public void start(ReadableMap options) {
    // Rollbar.configure(options)
  }

	@ReactMethod
  public void setUser(ReadableMap userInfo) {
      String userId = userInfo.hasKey("id") ? userInfo.getString("id") : null;
      String email = userInfo.hasKey("email") ? userInfo.getString("email") : null;
      String name = userInfo.hasKey("name") ? userInfo.getString("name") : null;
      Rollbar.setPersonData(userId, name, email);
  }

  @ReactMethod
  public void clearUser() {
      Rollbar.setPersonData(null, null, null);
  }
}

class RollbarReactNativePackage implements ReactPackage {
    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
      return Arrays.<NativeModule>asList(new RollbarReactNative(reactContext));
    }

    // Deprecated from RN 0.47
    public List<Class<? extends JavaScriptModule>> createJSModules() {
      return Collections.emptyList();
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
      return Collections.emptyList();
    }
}
