import Foundation
import Capacitor

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {
    private let implementation = AppCenterBase()
    
    public override func load() {
        let appSecret = getConfigValue("iosAppSecret") as? String ?? ""
        let enableInJs = getConfigValue("enableInJs") as? Bool ?? false
        
        implementation.configureWithSettings(appSecret)
        
        if enableInJs {
            // Avoid starting an analytics session since it will get enabled in JS
            implementation.enable(false)
        }
    }

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getInstallId()])
    }
    
//  TEST:  might not work after starting AppCenter service
    @objc func setUserId(_ call: CAPPluginCall) {
        implementation.setUserId(call.getString("userId") ?? "")
        call.resolve()
    }
    
    @objc func getSdkVersion(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getSdkVersion()])
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isEnabled()])
    }
    
    @objc func enable(_ call: CAPPluginCall) {
        implementation.enable(call.getBool("enableFlag") ?? false)
        call.resolve()
    }
    
//    @objc func setLogLevel(_ call: CAPPluginCall) {
//        guard let level = call.options["logLevel"] as? Int else {
//            
//            call.reject("Must provide an id")
//            return
//        }
//        
//        AppCenter.logLevel = LogLevel.init(rawValue: UInt(call.getInt("logLevel") ?? 7)) ?? .assert
//        call.resolve()
//    }
//    @objc func setCustomProperties(_ call: CAPPluginCall) {
//        var properties: JSObject = call.getObject("customProperties") ?? [:]
//        
//        let customProperties = CustomProperties()
//        customProperties.setValuesForKeys(properties)
//        
//        AppCenter.setCustomProperties(customProperties)
//        
//        call.resolve()
//    }
}
