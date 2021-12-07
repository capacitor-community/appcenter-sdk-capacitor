import Foundation
import Capacitor
import AppCenter

@objc public class AppCenterBase: NSObject {

    public func isNetWorkRequestsAllowed() -> Bool {
        return AppCenter.networkRequestsAllowed
    }

    public func setNetworkRequestsAllowed(_ shouldAllow: Bool) {
        AppCenter.networkRequestsAllowed = shouldAllow
    }

    public func setLogLevel(_ level: Int) {
        AppCenter.logLevel = LogLevel.init(rawValue: UInt(level)) ?? .verbose
    }

    public func getLogLevel() -> UInt {
        return AppCenter.logLevel.rawValue
    }

    public func getInstallId() -> String {
        return AppCenter.installId.uuidString
    }

    public func getSdkVersion() -> String {
        return AppCenter.sdkVersion
    }

    public func setUserId(_ id: String) {
        AppCenter.userId = id
    }

    public func enable(_ flag: Bool) {
        AppCenter.enabled = flag
    }

    public func isEnabled() -> Bool {
        return AppCenter.enabled
    }

    public func setCustomProperties(_ properties: [String: [String: Any]]) {
        let customProperties = CustomProperties()

        for (propName, propData) in properties {

            if let type = propData["type"] as? String {
                
                if type == "string", let value = propData["value"] as? String {
                    customProperties.set(value, forKey: propName)
                } else if type == "number", let value = propData["value"] as? NSNumber {
                    customProperties.set(value, forKey: propName)
                } else if type == "boolean", let value = propData["value"] as? Bool {
                    customProperties.set(value, forKey: propName)
                } else if type == "date-time", let value = propData["value"] as? Double {
                    let date = Date.init(timeIntervalSince1970: value)
                    customProperties.set(date, forKey: propName)
                } else if type == "clear" {
                    customProperties.clearProperty(forKey: propName)
                }
            }
        }

        AppCenter.setCustomProperties(customProperties)
    }

}
