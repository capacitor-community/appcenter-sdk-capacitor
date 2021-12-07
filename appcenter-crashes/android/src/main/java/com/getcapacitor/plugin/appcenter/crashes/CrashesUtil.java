package com.getcapacitor.plugin.appcenter.crashes;

import android.util.Base64;
import android.util.Log;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.microsoft.appcenter.crashes.ingestion.models.ErrorAttachmentLog;
import com.microsoft.appcenter.crashes.ingestion.models.Exception;
import com.microsoft.appcenter.crashes.model.ErrorReport;
import com.microsoft.appcenter.ingestion.models.Device;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

/**
 * Utility class containing helpers for converting App Center objects.
 */
public class CrashesUtil {

    private static final String LOG_TAG = "AppCenterCrashes";
    private static final String DATA_FIELD = "data";
    private static final String TEXT_FIELD = "text";
    private static final String FILE_NAME_FIELD = "fileName";
    private static final String CONTENT_TYPE_FIELD = "contentType";

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
     * Creates an AppCenter Exception model out of JSObject.
     * Used for creating an actual Exception model out of passed in data from a plugin call from js.
     * @param jsObject JSObject to convert
     * @return AppCenter Exception model
     */
    public static Exception toExceptionModel(JSObject jsObject) {
        Exception model = new Exception();
        try {
            model.read(jsObject);
            if (model.getType() == null || model.getType().equals("")) {
                throw new java.lang.Exception("Type value shouldn't be null or empty");
            }
            if (model.getMessage() == null || model.getMessage().equals("")) {
                throw new java.lang.Exception("Message value shouldn't be null or empty");
            }
            if (model.getWrapperSdkName() == null || model.getWrapperSdkName().equals("")) {
                throw new java.lang.Exception("wrapperSdkName value shouldn't be null or empty");
            }
        } catch (java.lang.Exception e) {
            CrashesUtil.logError("Failed to get exception model");
            CrashesUtil.logError(Log.getStackTraceString(e));
        }
        return model;
    }

    /**
     * Converts JSObject to String Map
     * @param jsObject JSObject to convert
     * @return String map
     */
    public static Map<String, String> convertJSObjectToStringMap(JSObject jsObject) {
        Map<String, String> stringMap = new HashMap<>();
        if (jsObject != null) {
            Iterator<String> keys = jsObject.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                String value = jsObject.getString(key);
                stringMap.put(key, value);
            }
        }
        return stringMap;
    }

    /**
     * Creates a Collection of AppCenter ErrorAttachmentLog from a JSArray of attachment objects
     * Used for extracting attachments from a plugin call from js to be able to upload it to AppCenter.
     * @param attachments JSArray of attachment objects
     * @return Collection of ErrorAttachmentLog
     */
    public static Collection<ErrorAttachmentLog> toCustomErrorAttachments(JSArray attachments) {
        Collection<ErrorAttachmentLog> attachmentLogs = new LinkedList<>();
        try {
            for (int i = 0; i < attachments.length(); i++) {
                JSONObject jsAttachment = attachments.getJSONObject(i);
                String fileName = null;
                if (jsAttachment.has(FILE_NAME_FIELD)) {
                    fileName = jsAttachment.getString(FILE_NAME_FIELD);
                }
                if (jsAttachment.has(TEXT_FIELD)) {
                    String text = jsAttachment.getString(TEXT_FIELD);
                    attachmentLogs.add(ErrorAttachmentLog.attachmentWithText(text, fileName));
                } else {
                    String encodedData = jsAttachment.getString(DATA_FIELD);
                    byte[] data = Base64.decode(encodedData, Base64.DEFAULT);
                    String contentType = jsAttachment.getString(CONTENT_TYPE_FIELD);
                    attachmentLogs.add(ErrorAttachmentLog.attachmentWithBinary(data, fileName, contentType));
                }
            }
        } catch (java.lang.Exception e) {
            CrashesUtil.logError("Failed to get error attachment for report: " + attachments);
            CrashesUtil.logError(Log.getStackTraceString(e));
        }
        return attachmentLogs;
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

        for (int i = 0; i < reports.size(); i++) {
            ErrorReport report = reports.get(i);
            JSObject convertedReport = convertReportToJs(report);
            if (convertedReport != null) {
                jsReadyReports.add(convertedReport);
            }
        }

        return jsReadyReports;
    }
}
