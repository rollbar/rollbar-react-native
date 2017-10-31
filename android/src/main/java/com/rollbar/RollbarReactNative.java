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

import com.rollbar.android.Rollbar;
import com.rollbar.notifier.config.Config;
import com.rollbar.notifier.config.ConfigBuilder;
import com.rollbar.notifier.config.ConfigProvider;

public class RollbarReactNative extends ReactContextBaseJavaModule {
  private static final String REACT_NATIVE = "react-native";
  private static final String NOTIFIER_VERSION = "0.1.0";
  private ReactContext reactContext;

  public static ReactPackage getPackage() {
    return new RollbarReactNativePackage();
  }

  public RollbarReactNative(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  public static void init(Context context, String accessToken, String environment) {
    Rollbar.init(context, accessToken, environment, true, false, new ConfigProvider() {
      @Override
      public Config provide(ConfigBuilder builder) {
        return builder
          .framework(REACT_NATIVE)
          .build();
      }
    });
  }

  @Override
  public String getName() {
    return "RollbarReactNative";
  }

  @ReactMethod
  public void init(ReadableMap options) {
    final String environment = options.hasKey("environment") ? options.getString("environment") : null;
    if (environment != null) {
      Rollbar.instance().configure(new ConfigProvider() {
        @Override
        public Config provide(ConfigBuilder builder) {
          return builder
            .environment(environment)
            .build();
        }
      });
    }
  }

	@ReactMethod
  public void setPerson(ReadableMap personInfo) {
      String userId = personInfo.hasKey("id") ? personInfo.getString("id") : null;
      String email = personInfo.hasKey("email") ? personInfo.getString("email") : null;
      String name = personInfo.hasKey("name") ? personInfo.getString("name") : null;
      Rollbar.instance().setPersonData(userId, name, email);
  }

  @ReactMethod
  public void clearPerson() {
      Rollbar.instance().clearPersonData();
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
