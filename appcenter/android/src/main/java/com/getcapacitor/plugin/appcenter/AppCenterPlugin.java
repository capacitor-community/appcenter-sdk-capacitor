package com.getcapacitor.plugin.appcenter;

// import android.app.Application;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.microsoft.appcenter.reactnative.shared.AppCenterReactNativeShared;

@CapacitorPlugin(name = "AppCenter")
public class AppCenterPlugin extends Plugin {

    private AppCenterBase implementation = new AppCenterBase();

    @Override
    public void load() {
        AppCenterReactNativeShared.configureAppCenter(this.getActivity().getApplication());
    }

    @PluginMethod
    public void getInstallId(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.getInstallId());
        call.resolve(ret);
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setUserId(PluginCall call) {
        implementation.setUserId(call.getString("userId", null));
        call.resolve();
    }

    @PluginMethod
    public void getSdkVersion(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.getSdkVersion());
        call.resolve(ret);
    }

    @PluginMethod
    public void isEnabled(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.isEnabled());
        call.resolve(ret);
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setEnabled(PluginCall call) {
        implementation.enable(call.getBoolean("enabled", false));
        call.resolve();
    }

    @PluginMethod
    public void getLogLevel(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.getLogLevel());
        call.resolve(ret);
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setLogLevel(PluginCall call) {
        if (!call.getData().has("logLevel")) {
            call.reject("Must provide a LogLevel");
            return;
        }

        implementation.setLogLevel(call.getInt("logLevel"));
        call.resolve();
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setCustomProperties(PluginCall call) {
        implementation.setCustomProperties(call.getObject("properties", new JSObject()));
        call.resolve();
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setNetworkRequestsAllowed(PluginCall call) {
        implementation.setNetworkRequestsAllowed(call.getBoolean("isAllowed", true));
        call.resolve();
    }

    @PluginMethod
    public void isNetworkRequestsAllowed(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.isNetworkRequestsAllowed());
        call.resolve(ret);
    }
}
