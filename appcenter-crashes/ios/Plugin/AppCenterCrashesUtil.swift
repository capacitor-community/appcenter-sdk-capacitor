import Foundation
import Capacitor
import AppCenterCrashes

/**
 Utility class containing helpers for converting App Center objects.
*/
public class CrashesUtil {
    static let kMSSdkName: String = "sdkName";
    static let kMSSdkVersion: String = "sdkVersion";
    static let kMSModel: String = "model";
    static let kMSOemName: String = "oemName";
    static let kMSOsName: String = "osName";
    static let kMSOsVersion: String = "osVersion";
    static let kMSOsBuild: String = "osBuild";
    static let kMSOsApiLevel: String = "osApiLevel";
    static let kMSLocale: String = "locale";
    static let kMSTimeZoneOffset: String = "timeZoneOffset";
    static let kMSScreenSize: String = "screenSize";
    static let kMSAppVersion: String = "appVersion";
    static let kMSCarrierName: String = "carrierName";
    static let kMSCarrierCountry: String = "carrierCountry";
    static let kMSAppBuild: String = "appBuild";
    static let kMSAppNamespace: String = "appNamespace";
    
    enum ExceptionModelError: Error {
        case validationError(_ message: String)
    }
    
    /**
        Creates an AppCenter WrapperExceptionModel out of given JSObject.
        Used for creating an acrual exception model out of passed in data from a plugin call from js.
            - Parameter jsObject: JSObject that contains MSACWrapperExceptionModel props
            - Returns MSACWrapperExceptionModel
     */
    public static func toExceptionModel(_ jsObject: JSObject?) throws -> MSACWrapperExceptionModel {
        if (jsObject == nil) {
            throw ExceptionModelError.validationError("Exception model cannot be nil")
        }
        
        let model = MSACWrapperExceptionModel()
        
        if (jsObject?["type"] == nil || jsObject?["type"] as? String == "") {
            throw ExceptionModelError.validationError("Type value shouldn't be nil or empty")
        }
        if (jsObject?["message"] == nil || jsObject?["message"] as? String == "") {
            throw ExceptionModelError.validationError("Message value shouldn't be nil or empty")
        }
        if (jsObject?["wrapperSdkName"] == nil || jsObject?["wrapperSdkName"] as? String == "") {
            throw ExceptionModelError.validationError("wrapperSdkName value shouldn't be nil or empty")
        }
        model.type = jsObject?["type"] as? String
        model.message = jsObject?["message"] as? String
        model.wrapperSdkName = jsObject?["wrapperSdkName"] as? String
        if (jsObject?["stackTrace"] != nil) {
            model.stackTrace = jsObject?["stackTrace"] as? String
        }
        
        return model
    }
    
    public static func toErrorAttachmentLogs(_ attachments: [JSObject]) -> [ErrorAttachmentLog] {
        var attachmentLogs: [ErrorAttachmentLog] = []

        for jsAttachment in attachments {
            var fileName: String? = nil
            if (jsAttachment["fileName"] != nil ) {
                fileName = jsAttachment["fileName"] as? String
            }
            if (jsAttachment["text"] != nil) {
                let text = jsAttachment["text"] as? String
                let attachmentLog = ErrorAttachmentLog.attachment(withText: text, filename: fileName)
                attachmentLogs.append(attachmentLog!)
            } else if(jsAttachment["data"] != nil) {
                // Binary data is passed as base64 string from Javascript, decode it
                let encodedData = jsAttachment["data"] as? String ?? ""
                let decodedData = Data(base64Encoded: encodedData, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
                
                var contentType: String? = nil
                if (jsAttachment["contentType"] != nil) {
                    contentType = jsAttachment["contentType"] as? String
                }
                
                let attachmentLog = ErrorAttachmentLog.attachment(withBinary: decodedData, filename: fileName, contentType: contentType)
                attachmentLogs.append(attachmentLog!)
            }
        }
        
        return attachmentLogs
    }
   
    /**
     Serializes App Center Device properties to Dictionary
        - Parameter device: App Center Device
        - Returns Device Dictionary
    */
    public static func serializeDeviceToDictionary(device: Device) -> Dictionary<String, Any> {
        var dict = [String: Any]()
       
        dict[CrashesUtil.kMSSdkName] = device.sdkName;
        dict[CrashesUtil.kMSSdkVersion] = device.sdkVersion;
        dict[CrashesUtil.kMSModel] = device.model;
        dict[CrashesUtil.kMSOemName] = device.oemName;
        dict[CrashesUtil.kMSOsName] = device.osName;
        dict[CrashesUtil.kMSOsVersion] = device.osVersion;
       
        if device.osBuild != nil {
            dict[CrashesUtil.kMSOsBuild] = device.osBuild!;
        }
        if device.osApiLevel != nil {
            dict[CrashesUtil.kMSOsApiLevel] = device.osApiLevel!;
        }
        
        dict[CrashesUtil.kMSLocale] = device.locale;
        dict[CrashesUtil.kMSTimeZoneOffset] = device.timeZoneOffset;
        dict[CrashesUtil.kMSScreenSize] = device.screenSize;
        dict[CrashesUtil.kMSAppVersion] = device.appVersion;
       
        if device.carrierName != nil {
            dict[CrashesUtil.kMSCarrierName] = device.carrierName!;
        }
        if device.carrierCountry != nil {
            dict[CrashesUtil.kMSCarrierCountry] = device.carrierCountry!;
        }
        
        dict[CrashesUtil.kMSAppBuild] = device.appBuild;
        
        if device.appNamespace != nil {
            dict[CrashesUtil.kMSAppNamespace] = device.appNamespace!;
        }
        
        return dict;
    }
   
   /**
       Converts App Center ErrorReport to Dictionary
       - Parameter report: App Center ErrorReport
       - Returns JS optional Dictionary
    */
    public static func convertReportToJs(report: ErrorReport?) -> Dictionary<String, Any>? {

        guard let actualReport = report else {
            return nil
        }
       
        var dict = [String: Any]()
       
        dict["id"] = actualReport.incidentIdentifier
        dict["signal"] = actualReport.signal
        if let exceptionName = actualReport.exceptionName {
            dict["exceptionName"] = exceptionName
        }
        if let exceptionReason = actualReport.exceptionReason {
            dict["exceptionReason"] = exceptionReason
        }
        if let startTime = actualReport.appStartTime {
            dict["appStartTime"] = String(startTime.timeIntervalSince1970)
        }
        if let errTime = actualReport.appErrorTime {
            dict["appErrorTime"] = String(errTime.timeIntervalSince1970)
        }
        dict["device"] = serializeDeviceToDictionary(device: actualReport.device)
        dict["appProcessIdentifier"] = actualReport.appProcessIdentifier
           
        return dict
   }

   /**
       Converts array of App Center ErrorReports to a Dictionary
       - Parameter reports: App Center ErrorReport
       - Returns Array of Dictionaries
    */
   public static func convertReportsToJS (reports: [ErrorReport]) -> [[String: Any]] {
       var jsReadyReports = [[String: Any]]()
       for (_, value) in reports.enumerated() {
           guard let convertedReport = convertReportToJs(report: value) else {
               continue
           }
           jsReadyReports.append(convertedReport)
       }
       return jsReadyReports
   }

}
