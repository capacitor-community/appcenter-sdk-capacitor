import Foundation
import Capacitor
import AppCenter
import AppCenterAnalytics
//    need to move most of this functionality to a shared module accros all AppCenter<plugin_name> plugins
@objc public class AppCenterAnalyticsBase: NSObject {
    
    var appSecret: String?
    var logUrl: String?
    var wrapperSdk: WrapperSdk?
    
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
    
        if AppCenter.isConfigured {
            AppCenter.startService(Analytics.self)
            return
        }
        
        AppCenter.logLevel = .info
        
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.0.1", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)
        
        
        self.wrapperSdk = wrapperSdk
        AppCenter.configure(withAppSecret: self.getAppSecretWithSettings("0000-0000-0000-0000-000000000000"))

    }
    
    func setAppSecret(secret: String) {
        appSecret = secret
    }
    
    func getAppSecretWithSettings(_ secret: String) -> String {
        if(appSecret != nil) {
            appSecret = secret
        }
        
        return appSecret ?? ""
    }
    
    func getWrapperSdk() -> WrapperSdk {
        return wrapperSdk!
    }
    
    func setWrapperSdk(sdk: WrapperSdk) {
        wrapperSdk = sdk
        AppCenter.wrapperSdk = sdk
    }

}
