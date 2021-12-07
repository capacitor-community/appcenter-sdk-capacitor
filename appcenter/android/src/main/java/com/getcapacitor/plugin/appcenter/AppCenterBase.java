package com.getcapacitor.plugin.appcenter;

import com.getcapacitor.JSObject;
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.CustomProperties;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;
import org.json.JSONObject;

public class AppCenterBase {

    public void setNetworkRequestsAllowed(boolean shouldAllow) {
        AppCenter.setNetworkRequestsAllowed(shouldAllow);
    }

    public boolean isNetworkRequestsAllowed() {
        return AppCenter.isNetworkRequestsAllowed();
    }

    public void setLogLevel(int level) {
        AppCenter.setLogLevel(level);
    }

    public int getLogLevel() {
        return AppCenter.getLogLevel();
    }

    public String getInstallId() {
        UUID installId = AppCenter.getInstallId().get();
        return installId == null ? null : installId.toString();
    }

    public String getSdkVersion() {
        return AppCenter.getSdkVersion();
    }

    public void setUserId(String userId) {
        AppCenter.setUserId(userId);
    }

    public void enable(boolean enabled) {
        AppCenter.setEnabled(enabled).get();
    }

    public boolean isEnabled() {
        return AppCenter.isEnabled().get();
    }

    public void setCustomProperties(JSObject properties) {
        CustomProperties customProps = new CustomProperties();
        Iterator<String> keysIter = properties.keys();

        while (keysIter.hasNext()) {
            String key = keysIter.next();
            // JSONObject valueObject = (JSONObject) properties.getJSObject(key);
            JSObject valueObject = properties.getJSObject(key);

            if (valueObject != null) {
                String type = valueObject.getString("type");
                switch (type) {
                    case "clear":
                        customProps.clear(key);
                        break;
                    case "string":
                        customProps.set(key, valueObject.getString("value"));
                        break;
                    case "number":
                        customProps.set(key, Double.parseDouble(valueObject.getString("value")));
                        break;
                    case "boolean":
                        customProps.set(key, valueObject.getBool("value"));
                        break;
                    case "date-time":
                        customProps.set(key, new Date((long) Double.parseDouble(valueObject.getString("value"))));
                        break;
                }
            }
        }

        AppCenter.setCustomProperties(customProps);
    }
}
