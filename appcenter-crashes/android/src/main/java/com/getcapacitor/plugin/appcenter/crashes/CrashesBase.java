package com.getcapacitor.plugin.appcenter.crashes;

import com.getcapacitor.JSObject;
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.crashes.Crashes;

public class CrashesBase {

  public void enable(boolean enabled) {
    Crashes.setEnabled(enabled).get();
  }

  public boolean isEnabled() {
    return Crashes.isEnabled().get();
  }

  public void start() {
    if (AppCenter.isConfigured()) {
      AppCenter.start(Crashes.class);
    }      
  }

  public void generateTestCrash() {
    Crashes.generateTestCrash();
  }

  public boolean hasReceivedMemoryWarningInLastSession() {
    return Crashes.hasReceivedMemoryWarningInLastSession().get();
  }

  public boolean hasCrashedInLastSession() {
    return Crashes.hasCrashedInLastSession().get();
  }

  public JSObject lastSessionCrashReport() {
    return CrashesUtil.convertReportToJs(Crashes.getLastSessionCrashReport().get());
  }
}
