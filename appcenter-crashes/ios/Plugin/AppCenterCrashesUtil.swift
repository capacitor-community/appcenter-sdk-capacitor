import Foundation
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
       for (index, value) in reports.enumerated() {
           guard let convertedReport = convertReportToJs(report: value) else {
               continue
           }
           jsReadyReports.append(convertedReport)
       }
       return jsReadyReports
   }

}
