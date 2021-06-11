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
   public func serializeDeviceToDictionary(device: Device) -> Dictionary<String, Any> {
       var dict = [String: Any]()
       
       if !device.sdkName.isEmpty {
           dict[CrashesUtil.kMSSdkName] = device.sdkName;
       }
       if !device.sdkName.isEmpty {
           dict[CrashesUtil.kMSSdkVersion] = device.sdkVersion;
       }
       if !device.model.isEmpty {
           dict[CrashesUtil.kMSModel] = device.model;
       }
       if !device.oemName.isEmpty {
           dict[CrashesUtil.kMSOemName] = device.oemName;
       }
       if !device.osName.isEmpty {
           dict[CrashesUtil.kMSOsName] = device.osName;
       }
       if !device.osVersion.isEmpty {
           dict[CrashesUtil.kMSOsVersion] = device.osVersion;
       }
       if !device.osBuild.isEmpty {
           dict[CrashesUtil.kMSOsBuild] = device.osBuild;
       }
       if device.osApiLevel != nil {
           dict[CrashesUtil.kMSOsApiLevel] = device.osApiLevel!;
       }
       if !device.locale.isEmpty {
           dict[CrashesUtil.kMSLocale] = device.locale;
       }
       if device.timeZoneOffset != nil {
           dict[CrashesUtil.kMSTimeZoneOffset] = device.timeZoneOffset!;
       }
       if !device.screenSize.isEmpty {
           dict[CrashesUtil.kMSScreenSize] = device.screenSize;
       }
       if !device.appVersion.isEmpty {
           dict[CrashesUtil.kMSAppVersion] = device.appVersion;
       }
       if !device.carrierName.isEmpty {
           dict[CrashesUtil.kMSCarrierName] = device.carrierName;
       }
       if !device.carrierCountry.isEmpty {
           dict[CrashesUtil.kMSCarrierCountry] = device.carrierCountry;
       }
       if !device.appBuild.isEmpty {
           dict[CrashesUtil.kMSAppBuild] = device.appBuild;
       }
       if !device.appNamespace.isEmpty {
           dict[CrashesUtil.kMSAppNamespace] = device.appNamespace;
       }
       return dict;
   }
   
   /**
       Converts App Center ErrorReport to Dictionary
       - Parameter report: App Center ErrorReport
       - Returns JS optional Dictionary
    */
   public func convertReportToJs(report: ErrorReport?) -> Dictionary<String, Any>? {

       guard let actualReport = report else {
           return nil
       }
       
       var dict = [String: Any]()
       
       let identifier: String = actualReport.incidentIdentifier
       if !identifier.isEmpty {
           dict["id"] = identifier
       }
       
       let processIdentifier: UInt = actualReport.appProcessIdentifier
       dict["appProcessIdentifier"] = String(processIdentifier)

       let startTime: Date? = actualReport.appStartTime
       if startTime != nil {
           dict["appStartTime"] = String(startTime!.timeIntervalSince1970)
       }

       let errTime: Date? = actualReport.appErrorTime
       if errTime != nil {
           dict["appErrorTime"] = errTime!.timeIntervalSince1970
       }
       
       let exceptionName: String = actualReport.exceptionName
       if !exceptionName.isEmpty {
           dict["exceptionName"] = exceptionName
       }
       
       let exceptionReason: String = actualReport.exceptionReason
       if !exceptionReason.isEmpty {
           dict["exceptionReason"] = exceptionReason
       }

       let signal: String = actualReport.signal
       if !signal.isEmpty {
           dict["signal"] = signal
       }

       dict["device"] = serializeDeviceToDictionary(device: actualReport.device)
       
       return dict
   }

   /**
       Converts arrat of App Center ErrorReports to a Dictionary
       - Parameter reports: App Center ErrorReport
       - Returns Array of Dictionaries
    */
   public func convertReportsToJS (reports: [ErrorReport]) -> [[String: Any]] {
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
