package com.getcapacitor.plugin.appcenter.analytics;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.analytics.Analytics;
import com.microsoft.appcenter.reactnative.shared.AppCenterReactNativeShared;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

@CapacitorPlugin(name = "Analytics")
public class AnalyticsPlugin extends Plugin {

    private AnalyticsBase implementation = new AnalyticsBase();

    @Override
    public void load() {
        AppCenterReactNativeShared.configureAppCenter(this.getActivity().getApplication());

        // todo: get additional config options

        if (AppCenter.isConfigured()) {
            AppCenter.start(Analytics.class);
            // if (!startEnabled) {
            //     Analytics.setEnabled(false);
            // }
        }
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void setEnabled(PluginCall call) {
        implementation.enable(call.getBoolean("enable", false));
        call.resolve();
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void pause(PluginCall call) {
        implementation.pause();
        call.resolve();
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void resume(PluginCall call) {
        implementation.resume();
        call.resolve();
    }

    @PluginMethod
    public void isEnabled(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("value", implementation.isEnabled());
        call.resolve(ret);
    }

    @PluginMethod(returnType = PluginMethod.RETURN_NONE)
    public void trackEvent(PluginCall call) {
        if (!call.getData().has("name")) {
            call.reject("Must provide an event name");
            return;
        }
        String name = call.getString("name");

        String flag = call.getString("flag", "normal");

        Map<String, String> properties = mapFromJSON(call.getObject("properties", new JSObject()));

        implementation.trackEvent(name, properties, flag);
    }

    private static Map<String, String> mapFromJSON(JSONObject jsonObject) {
        if (jsonObject == null) {
            return null;
        }
        Map<String, String> map = new HashMap<>();
        Iterator<String> keysIter = jsonObject.keys();
        while (keysIter.hasNext()) {
            String key = keysIter.next();
            // Only support storing strings. Non-string data must be stringified in JS.
            String value = jsonObject.optString(key);
            if (value != null) {
                map.put(key, value);
            }
        }
        return map;
    }

    private static Object getObject(Object value) {
        if (value instanceof JSONObject) {
            value = mapFromJSON((JSONObject) value);
        } else if (value instanceof JSONArray) {
            value = listFromJSON((JSONArray) value);
        }
        return value;
    }

    private static List<Object> listFromJSON(JSONArray jsonArray) {
        List<Object> list = new ArrayList<>();
        for (int i = 0, count = jsonArray.length(); i < count; i++) {
            Object value = getObject(jsonArray.opt(i));
            if (value != null) {
                list.add(value);
            }
        }
        return list;
    }
}
