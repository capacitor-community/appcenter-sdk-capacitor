import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {
    private let implementation = AppCenterBase()
    
    public override func load() {
        AppCenterCapacitorShared.configureWithSettings()
    }

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getInstallId()])
    }
    
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
        implementation.enable(call.getBool("shouldEnable") ?? false)
        call.resolve()
    }
    
    @objc func getLogLevel(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getLogLevel()])
    }
    
    @objc func setLogLevel(_ call: CAPPluginCall) {
        guard let level = call.options["logLevel"] as? Int else {
            call.reject("Must provide LogLevel")
            return
        }
        
        implementation.setLogLevel(level)
        call.resolve()
    }
    
    @objc func setCustomProperties(_ call: CAPPluginCall) {
        let properties = call.options["properties"] as! [String: [String: Any]]
        implementation.setCustomProperties(properties)
        
        call.resolve()
    }
    
    @objc func networkRequestsAllowed(_ call: CAPPluginCall) {
        call.resolve(["value:": implementation.networkRequestsAllowed(call.getBool("shouldAllow"))])
    }
}
