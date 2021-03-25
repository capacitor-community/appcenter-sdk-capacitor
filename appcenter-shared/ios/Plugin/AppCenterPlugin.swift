import Foundation
import Capacitor

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {
    private let implementation = AppCenterBase()
    
    public override func load() {
        print("[AppCenterPlugin] load")
        let appSecret = self.bridge?.config.getString("AppCenter.iosAppSecret") ?? ""
        implementation.configureWithSettings(appSecret)
    }

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getInstallId()])
    }
    
//  Move to appcenter-crashes
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
    
    @objc func setCustomProperties(_ call: CAPPluginCall) {
        let properties: JSObject = call.getObject("properties") ?? [:]
        implementation.setCustomProperties(properties)
        
        call.resolve()
    }
}
