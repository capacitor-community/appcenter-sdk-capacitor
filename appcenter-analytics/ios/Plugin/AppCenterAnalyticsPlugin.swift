import Foundation
import Capacitor

@objc(AnalyticsPlugin)
public class AnalyticsPlugin: CAPPlugin {
    private let implementation = AppCenterAnalyticsBase()
    
    public override func load() {
        
        let appSecret = getConfigValue("iosAppSecret") as? String ?? ""
        let logInterval = UInt(getConfigValue("transmissionInterval") as? String ?? "3") ?? 3
        
        implementation.setTransmissionInterval(logInterval)
        implementation.configureWithSettings(appSecret)
    }
    
    @objc func enable(_ call: CAPPluginCall) {
        implementation.enable(call.getBool("enableFlag") ?? false)
        call.resolve()
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isEnabled()])
    }
    
    @objc func pause(_ call: CAPPluginCall) {
        implementation.pause()
        call.resolve()
    }
    
    @objc func resume(_ call: CAPPluginCall) {
        implementation.resume()
        call.resolve()
    }
    
    @objc func trackEvent(_ call: CAPPluginCall) {
        guard let name = call.options["name"] as? String else {
            call.reject("Must provide an event name")
            return
        }
        
        let properties = call.options["properties"] as? [String: String] ?? [:]
        let flag: String = call.getString("flag") ?? "none"
        
        implementation.trackEvent(name, properties, flag)
        
        call.resolve()
    }
}
