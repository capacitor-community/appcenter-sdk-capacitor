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

  /**
   * Track a handled custom exception
   * @param exception - JSObject containing AppCenter crashes.ingestion.models.Exception properties
   * @param properties - JSObject containing any custom properties for the exception
   * @param attachments - JSArray containing objects of  to save with the exception
   * @return
   */
  public String trackException(JSObject exception, JSObject properties, JSArray attachments) {
    Exception exceptionModel = CrashesUtil.toExceptionModel(exception);

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

  /**
   * Track a handled error
   * @param error Error to track
   */
  public void trackError(Throwable error) {
    trackError(error, null, null);
  }

  /**
   * Track a handled error with name and optional properties
   * @param error Error to track
   * @param properties
   */
  public void trackError(Throwable error, Map<String, String> properties) {
    trackError(error, properties, null);
  }

  /**
   * Track a handled error with name and optional properties and attachments.
   * @param error
   * @param properties 
   * @param attachments
   */
  public void trackError(Throwable error, Map<String, String> properties, Iterable<ErrorAttachmentLog> attachments) {
    Crashes.trackError(error, properties, attachments);
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
