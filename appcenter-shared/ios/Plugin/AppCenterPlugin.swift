import Foundation
import Capacitor
import AppCenter

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {
    private let implementation = AppCenterBase()
    
    public override func load() {
        let appSecret = self.bridge!.config.getPluginConfigValue("AppCenterPlugin", "IOS_APP_SECRET") ?? ""
        implementation.configureWithSettings(appSecret as! String)
    }

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.installId.uuidString])
    }

    @objc func setUserId(_ call: CAPPluginCall) {
        implementation.setUserId(call.getString("userId") ?? "")
        call.resolve()
    }
    
    @objc func getSdkVersion(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.sdkVersion!])
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.enabled])
    }
    
    @objc func enable(_ call: CAPPluginCall) {
        AppCenter.enabled = call.getBool("enableFlag") ?? false
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
