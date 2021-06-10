import Foundation
import AppCenter

public class AppCenterCapacitorShared: NSObject {
    
    static var startAutomatically: Bool = true
    static var configuration: NSDictionary = [:]
    static var appSecret: String?
    static var wrapperSdk: WrapperSdk?
    // plist keys
    static var kAppCenterSecretKey = "AppSecret"
    static var kAppCenterStartAutomaticallyKey = "StartAutomatically"
    static var kAppCenterConfigResource = "AppCenter-Config"
    
    public static func getConfiguration() -> NSDictionary {
        return configuration
    }
    
    public static func setStartAutomatically (_ shouldStartAutomatically: Bool) {
        startAutomatically = shouldStartAutomatically;
    }
    
    public static func configureWithSettings() {
        if AppCenter.isConfigured {
            return
        }
        
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.1.0", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)

        setWrapperSdk(wrapperSdk!)
        getAppSecret()
                
        if startAutomatically {
            if appSecret!.count == 0 {
                AppCenter.configure()
            }
            else {
                AppCenter.configure(withAppSecret: appSecret)
            }
        }
    }
    
    public static func setAppSecret(_ secret: String) {
        appSecret = secret
    }
    
    public static func getAppSecret() {
        if appSecret == nil {
            // get values from config plist
            let plist = Bundle.main.path(forResource: AppCenterCapacitorShared.kAppCenterConfigResource, ofType: "plist")
            configuration = NSDictionary(contentsOfFile: plist!)!
            appSecret = configuration[AppCenterCapacitorShared.kAppCenterSecretKey] as? String
            
            // start automatically flag true by default
            if let rawStartAutomatically = configuration[AppCenterCapacitorShared.kAppCenterStartAutomaticallyKey] as? Bool {
                startAutomatically = rawStartAutomatically
            }
        }
    }
    
    public static func getWrapperSdk() -> WrapperSdk? {
        return wrapperSdk
    }
    
    public static func setWrapperSdk(_ sdk: WrapperSdk) {
        wrapperSdk = sdk
        AppCenter.wrapperSdk = sdk
    }

}
