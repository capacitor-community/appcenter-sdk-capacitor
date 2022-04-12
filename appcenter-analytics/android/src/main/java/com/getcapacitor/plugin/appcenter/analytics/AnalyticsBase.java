package com.getcapacitor.plugin.appcenter.analytics;

import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.Flags;
import com.microsoft.appcenter.analytics.Analytics;
import java.util.Map;

public class AnalyticsBase {

    public void trackEvent(String name, Map<String, String> properties, String flag) {
        int analyticsFlag;

        switch (flag) {
            case "critical":
                analyticsFlag = Flags.CRITICAL;
                break;
            case "normal":
                analyticsFlag = Flags.NORMAL;
                break;
            default:
                analyticsFlag = Flags.NORMAL;
                break;
        }
        Analytics.trackEvent(name, properties, analyticsFlag);
    }

    public void setTransmissionInterval(int seconds) {
        Analytics.setTransmissionInterval(seconds);
    }

    public void start() {
        AppCenter.start(Analytics.class);
    }

    public void pause() {
        Analytics.pause();
    }

    public void resume() {
        Analytics.resume();
    }

    public void enable(boolean enable) {
        Analytics.setEnabled(enable).get();
    }

    public boolean isEnabled() {
        return Analytics.isEnabled().get();
    }

    public void enableManualSessionTracker() {
        Analytics.enableManualSessionTracker();
    }

    public void startSession() {
        Analytics.startSession();
    }
}
