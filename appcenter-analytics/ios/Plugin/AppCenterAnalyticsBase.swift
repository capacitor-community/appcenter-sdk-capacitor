import Foundation
import Capacitor
import AppCenter
import AppCenterAnalytics

//    need to move most of this functionality to a shared module accros all AppCenter<plugin_name> plugins
@objc public class AppCenterAnalyticsBase: NSObject {
    
    var appSecret: String?
    var logUrl: String?
    var wrapperSdk: WrapperSdk?
    
    public func trackEvent(_ name: String, _ properties: [String: String]?, _ flag: String) {
        let analyticsFlag: Flags
        
        switch flag {
        case "critical":
            analyticsFlag = .critical
        case "normal":
            analyticsFlag = .normal
        default:
            analyticsFlag = .default
        }
        Analytics.trackEvent(name, withProperties: properties, flags: analyticsFlag)
    }
    
    public func setTransmissionInterval(_ seconds: UInt) {
        Analytics.transmissionInterval = seconds
    }
    
    public func pause() {
        Analytics.pause();
    }
    
    public func resume() {
        Analytics.resume();
    }
    
    public func enable(_ flag: Bool) {
        Analytics.enabled = flag
    }
    
    public func isEnabled() -> Bool {
        return Analytics.enabled
    }
    
    public func configureWithSettings(_ secret: String) {
        AppCenter.logLevel = .verbose
        
        if AppCenter.isConfigured {
            AppCenter.startService(Analytics.self)
            return
        }
        
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.1.0", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)
        
        setWrapperSdk(wrapperSdk!)
        
        AppCenter.start(withAppSecret: getAppSecret(secret), services: [Analytics.self])
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
