import Foundation
import Capacitor
import AppCenter

//    need to move most of this functionality to a shared module accros all AppCenter<plugin_name> plugins
@objc public class AppCenterBase: NSObject {
    
    var appSecret: String?
    var logUrl: String?
    var wrapperSdk: WrapperSdk?
    
    public func setUserId(_ id: String) {
        AppCenter.userId = id
    }
    
    public func configureWithSettings(_ secret: String) {
    
        if AppCenter.isConfigured {
            return
        }
        
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.0.1", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)
        
        
        self.wrapperSdk = wrapperSdk
        AppCenter.configure(withAppSecret: "")
        
        AppCenter.logLevel = .verbose

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
