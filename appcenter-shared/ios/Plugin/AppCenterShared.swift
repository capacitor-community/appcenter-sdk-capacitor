import Foundation
import AppCenter

class AppCenterShared {
    var appSecret: String?
    var logUrl: String?
    var wrapperSdk: WrapperSdk?
    
    func setAppSecret(secret: String) {
        appSecret = secret
    }
    
    func setUserId(id: String) {
        AppCenter.userId = id
    }
    
    func getAppSecretWithSettings(settings: Dictionary<String, String>) -> String {
        if(appSecret != nil) {
            appSecret = settings["secret"]
        }
        
        return appSecret!
    }
    
    func configureWithSettings(settings: Dictionary<String, String>) {
        
        if AppCenter.isConfigured {
            return
        }
        
        var wrapperSdk = WrapperSdk(wrapperSdkVersion: "0.0.1", wrapperSdkName: "appcenter.capacitor", wrapperRuntimeVersion: nil, liveUpdateReleaseLabel: nil, liveUpdateDeploymentKey: nil, liveUpdatePackageHash: nil)
        
        self.wrapperSdk = wrapperSdk
        AppCenter.configure(withAppSecret: self.getAppSecretWithSettings(settings: settings))
        
//        NSString *logLevel = [settings cordovaSettingForKey:@"LOG_LEVEL"];
//        MSLogLevel logLevelValue = [logLevel intValue];
//        [MSAppCenter setLogLevel: logLevelValue];
//
//        logUrl = [settings cordovaSettingForKey:@"LOG_URL"];
//        if (logUrl != nil) {
//            [MSAppCenter setLogUrl:logUrl];
//        }
        
    }
    
    func getWrapperSdk() -> WrapperSdk {
        return wrapperSdk!
    }
    
    func setWrapperSdk(sdk: WrapperSdk) {
        wrapperSdk = sdk
        AppCenter.wrapperSdk = sdk
    }
}
