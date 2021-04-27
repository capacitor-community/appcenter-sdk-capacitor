import Foundation
import Capacitor
import AppCenter

//    need to move most of this functionality to a shared module accros all AppCenter plugins
@objc public class AppCenterBase: NSObject {
    
    var appSecret: String?
    var wrapperSdk: WrapperSdk?
    
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
            let type = propData["type"] as! String
            let value = propData["value"]
                        
            if type == "string" {
                customProperties.set(value as! String, forKey: propName)
            }
            else if type == "number" {
                customProperties.set(value as! NSNumber, forKey: propName)
            }
            else if type == "boolean" {
                customProperties.set(value as! Bool, forKey: propName)
            }
            else if type == "date-time" {
                let date = Date.init(timeIntervalSince1970: value as! Double)
                customProperties.set(date, forKey: propName)
            }
            else if type == "clear" {
                customProperties.clearProperty(forKey: propName)
            }
        }
        
        AppCenter.setCustomProperties(customProperties)
    }
    
    public func configureWithSettings(_ secret: String) {
        if AppCenter.isConfigured {
            return
        }
        
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.1.0", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)

        setWrapperSdk(wrapperSdk!)

        AppCenter.configure(withAppSecret: getAppSecret(secret))
    }
    
    func setAppSecret(_ secret: String) {
        appSecret = secret
    }
    
    func getAppSecret(_ secret: String) -> String {
        if appSecret == nil {
            setAppSecret(secret)
        }
        return appSecret!
    }
    
    func getWrapperSdk() -> WrapperSdk {
        return wrapperSdk!
    }
    
    func setWrapperSdk(_ sdk: WrapperSdk) {
        wrapperSdk = sdk
        AppCenter.wrapperSdk = sdk
    }

}
