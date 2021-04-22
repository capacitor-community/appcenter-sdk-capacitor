import Foundation
import Capacitor
import AppCenter
import AppCenterCrashes

//    need to move most of this functionality to a shared module accros all AppCenter<plugin_name> plugins
@objc public class AppCenterCrashesBase: NSObject {
   
   var appSecret: String?
   var wrapperSdk: WrapperSdk?
   
   public func enable(_ flag: Bool) {
       Crashes.enabled = flag
   }
   
   public func isEnabled() -> Bool {
       return Crashes.enabled
   }
   
   public func configureWithSettings(_ secret: String) {
       AppCenter.logLevel = .verbose
       
       if AppCenter.isConfigured {
           AppCenter.startService(Crashes.self)
           return
       }
       
       let wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.1.0", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)
       
       setWrapperSdk(wrapperSdk!)
       
       AppCenter.start(withAppSecret: getAppSecret(secret), services: [Crashes.self])
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
