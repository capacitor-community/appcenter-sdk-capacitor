import Foundation
import Capacitor
import AppCenter

//    need to move most of this functionality to a shared module accros all AppCenter<plugin_name> plugins
@objc public class AppCenterBase: NSObject {
    
    var appSecret: String?
    var logUrl: String?
    var wrapperSdk: WrapperSdk?
    
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
    
    public func setCustomProperties(_ properties: JSObject) {
//        let customProperties = CustomProperties()
        
        // JSObject [String: JSValue]
        // JS: {"color":{"type":"string","value":"blue"},"score":{"type":"number","value":10}}
        // swift: ["score": ["type": "number", "value": 10], "color": value: ["value": "blue", "type": "string"]]
        
//        AppCenter.setCustomProperties(customProperties)
    }
    
    public func clearCustomProperty(name: String) {
//        customProperties.clearProperty(forKey: name)
    }
    
    public func configureWithSettings(_ secret: String) {
        AppCenter.logLevel = .verbose

        if AppCenter.isConfigured {
            return
        }
        
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.1.0", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)

        setWrapperSdk(wrapperSdk!)

        AppCenter.configure(withAppSecret: getAppSecret(secret))
//        AppCenter.start(withAppSecret: getAppSecret(secret), services: [])
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
