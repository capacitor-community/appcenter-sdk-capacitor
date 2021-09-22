package com.getcapacitor.plugin.appcenter.crashes;

import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.crashes.Crashes;
import com.microsoft.appcenter.crashes.WrapperSdkExceptionManager;
import com.microsoft.appcenter.crashes.ingestion.models.ErrorAttachmentLog;
import com.microsoft.appcenter.crashes.ingestion.models.Exception;

import java.util.Map;

public class CrashesBase {

  public String trackError(JSObject error, JSObject properties, JSArray attachments) {
    Exception exceptionModel = CrashesUtil.toExceptionModel(error);

    Map<String, String> convertedProperties = null;
    if (properties != null) {
      convertedProperties = CrashesUtil.convertJSObjectToStringMap(properties);
    }

    Iterable<ErrorAttachmentLog> convertedAttachments = null;
    if (attachments != null) {
      convertedAttachments = CrashesUtil.toCustomErrorAttachments(attachments);
    }

    return WrapperSdkExceptionManager.trackException(exceptionModel, convertedProperties, convertedAttachments);
  }

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
