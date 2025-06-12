package com.rollbar;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;

import java.util.HashMap;
import org.junit.Before;
import org.junit.Test;
import org.mockito.MockedStatic;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

public class RollbarReactNativeTest {

  private ApplicationInfo mockedApplicationInfo;
  private PackageManager mockedPackageManager;
  private RollbarReactNative rollbarModule;
  private ReactApplicationContext mockedContext;
  private ReadableMap mockedReadableMap;

  @Before
  public void setUp() {
    mockedContext = mock(ReactApplicationContext.class);
    mockedReadableMap = mock(ReadableMap.class);
    mockedPackageManager = mock(PackageManager.class);
    mockedApplicationInfo = mock(ApplicationInfo.class);
    rollbarModule = new RollbarReactNative(mockedContext);
  }

  @Test
  public void configUpdateDoNothingWhenNativeNotifierIsNotInitialized() {
    try (MockedStatic<Log> mockedLog = mockStatic(Log.class)) {

      rollbarModule.init(mockedReadableMap);

      mockedLog.verify(() -> Log.w("Rollbar", "Attempt to access Rollbar.instance() before initialization."));
    }
  }

  @Test
  public void configUpdateSuccessfulWhenNativeNotifierIsInitialized() throws NameNotFoundException {
    try (MockedStatic<Log> mockedLog = mockStatic(Log.class)) {
      initNativeNotifier();

      rollbarModule.init(mockedReadableMap);

      mockedLog.verify(never(), () -> Log.w("Rollbar", "Attempt to access Rollbar.instance() before initialization."));
    }
  }

  private void initNativeNotifier() throws NameNotFoundException {
    when(mockedContext.getPackageManager())
        .thenReturn(mockedPackageManager);

    when(mockedContext.getPackageName())
        .thenReturn("any");

    when(mockedPackageManager.getApplicationInfo("any", PackageManager.GET_META_DATA))
        .thenReturn(mockedApplicationInfo);

    RollbarReactNative.init(mockedContext, "Any token", "Any environment");
  }

}
