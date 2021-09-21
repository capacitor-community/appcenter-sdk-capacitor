package com.getcapacitor.plugin.appcenter.crashes;

import android.util.Base64;
import android.util.Log;

import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.microsoft.appcenter.crashes.ingestion.models.ErrorAttachmentLog;
import com.microsoft.appcenter.crashes.ingestion.models.Exception;

import org.json.JSONObject;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;

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
            while(keys.hasNext()) {
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
                if(jsAttachment.has(TEXT_FIELD)) {
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
}
