import Foundation
import Capacitor
import AppCenter

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.installId.uuidString])
    }

    @objc func setUserId(_ call: CAPPluginCall) {
        AppCenter.userId = call.getString("userId") ?? ""
        call.resolve()
    }
    
    @objc func getSdkVersion(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.sdkVersion])
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.enabled])
    }
    
    @objc func enable(_ call: CAPPluginCall) {
        AppCenter.enabled = call.getBool("enableFlag") ?? false
        call.resolve()
    }
    
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
