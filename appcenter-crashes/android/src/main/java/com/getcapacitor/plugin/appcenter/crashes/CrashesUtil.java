package com.getcapacitor.plugin.appcenter.crashes;

import android.util.Log;

import com.getcapacitor.JSObject;
import com.microsoft.appcenter.crashes.model.ErrorReport;
import com.microsoft.appcenter.ingestion.models.Device;

import java.util.ArrayList;
import java.util.List;

/**
 * Utility class containing helpers for converting App Center objects.
 */
public class CrashesUtil {
    private static final String LOG_TAG = "AppCenterCrashes";

    public static void logError(String message) {
        Log.e(LOG_TAG, message);
    }

    static void logInfo(String message) {
        Log.i(LOG_TAG, message);
    }

    static void logDebug(String message) {
        Log.d(LOG_TAG, message);
    }

    /**
     * Serializes App Center Device properties to Dictionary
     * @param device App Center Device
     * @return Device Dictionary
     */
    public static JSObject serializeDeviceToJs(Device device) {
        if (device == null) {
            return null;
        }
        JSObject dict = new JSObject();

        dict.put("sdkName", device.getSdkName());
        dict.put("sdkVersion", device.getSdkVersion());
        dict.put("model", device.getModel());
        dict.put("oemName", device.getOemName());
        dict.put("osName", device.getOsName());
        dict.put("osVersion", device.getOsVersion());
        if (device.getOsBuild() != null) {
            dict.put("osBuild", device.getOsBuild());
        }
        if (device.getOsApiLevel() != null) {
            dict.put("osApiLevel", device.getOsApiLevel());
        }
        dict.put("locale", device.getLocale());
        dict.put("timeZoneOffset", device.getTimeZoneOffset());
        dict.put("screenSize", device.getScreenSize());
        dict.put("appVersion", device.getAppVersion());
        if (device.getCarrierName() != null) {
            dict.put("carrierName", device.getCarrierName());
        }
        if (device.getCarrierCountry() != null) {
            dict.put("carrierCountry", device.getCarrierCountry());
        }
        dict.put("appBuild", device.getAppBuild());
        if (device.getAppNamespace() != null) {
            dict.put("appNamespace", device.getAppNamespace());
        }

        return dict;
    }

    /**
     * Converts App Center ErrorReport to Dictionary
     * @param report App Center ErrorReport
     * @return JS optional Dictionary
     */
    public static JSObject convertReportToJs(ErrorReport report) {
        if (report == null) {
            return null;
        }

        JSObject dict = new JSObject();

        dict.put("id", report.getId());

        if (report.getThreadName() != null) {
            String threadName = report.getThreadName();
            dict.put("threadName", threadName);
        }

        if (report.getStackTrace() != null) {
            String stackTrace = report.getStackTrace();
            dict.put("stackTrace", stackTrace);
        }

        if (report.getAppStartTime() != null) {
            String appStartTime = Long.toString(report.getAppStartTime().getTime());
            dict.put("appStartTime", appStartTime);
        }

        if (report.getAppErrorTime() != null) {
            String appErrorTime = Long.toString(report.getAppErrorTime().getTime());
            dict.put("appErrorTime", appErrorTime);
        }

        dict.put("device", serializeDeviceToJs(report.getDevice()));

        return dict;
    }

    /**
     * Converts list of App Center ErrorReports to a list of maps
     * @param reports App Center ErrorReport list
     * @return List of maps
     */
    public static List<JSObject> convertReportsToJs(List<ErrorReport> reports) {
        List<JSObject> jsReadyReports = new ArrayList<>();

        if (reports == null) {
            return jsReadyReports;
        }

        for(int i = 0; i < reports.size(); i++) {
            ErrorReport report = reports.get(i);
            JSObject convertedReport = convertReportToJs(report);
            if (convertedReport != null) {
                jsReadyReports.add(convertedReport);
            }
        }

        return jsReadyReports;
    }
}
