package com.getcapacitor.plugin.appcenter.crashes;

import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.microsoft.appcenter.reactnative.shared.AppCenterReactNativeShared;

@CapacitorPlugin(name = "Crashes")
public class CrashesPlugin extends Plugin {

    private final CrashesBase implementation = new CrashesBase();

    @Override
    public void load() {
        AppCenterReactNativeShared.configureAppCenter(this.getActivity().getApplication());
        implementation.start();
    }

    @PluginMethod
    public void trackError(PluginCall call) {
        JSObject error = call.getObject("error");
        JSObject properties = call.getObject("properties");
        JSArray attachments = call.getArray("attachments");

        String errorReportId;
        try {
            // We call trackException here and not trackError because the error is a custom error
            // parsed from JS instead of a Throwable error. It ends up the same in AppCenter
            errorReportId = implementation.trackException(error, properties, attachments);
        } catch (java.lang.Exception e) {
            call.reject("Exception while tracking error: " + e.getMessage());
            return;
        }

        JSObject ret = new JSObject();
        ret.put("value", errorReportId);
        call.resolve(ret);
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setEnabled(PluginCall call) {
        Boolean enable = call.getBoolean("enable", false);
        if (enable == null) {
            enable = false;
        }
        implementation.enable(enable);
        call.resolve();
    }

    @PluginMethod
    public void isEnabled(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.isEnabled());
        call.resolve(ret);
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void generateTestCrash(PluginCall call) {
        implementation.generateTestCrash();
        call.resolve();
    }

    @PluginMethod
    public void hasReceivedMemoryWarningInLastSession(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.hasReceivedMemoryWarningInLastSession());
        call.resolve(ret);
    }

    @PluginMethod
    public void hasCrashedInLastSession(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.hasCrashedInLastSession());
        call.resolve(ret);
    }

    @PluginMethod
    public void lastSessionCrashReport(PluginCall call) {
        JSObject lastSessionCrashReport = implementation.lastSessionCrashReport();
        if (lastSessionCrashReport == null) {
            call.reject("No crash report available");
            return;
        }
        JSObject ret = new JSObject();
        ret.put("value", lastSessionCrashReport);
        call.resolve(ret);
    }
}
