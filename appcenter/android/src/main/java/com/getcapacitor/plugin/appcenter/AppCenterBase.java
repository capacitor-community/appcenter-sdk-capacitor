package com.getcapacitor.plugin.appcenter;

import java.util.UUID;

import com.microsoft.appcenter.AppCenter;

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

    // public void setCustomProperties() {

    // }
}
