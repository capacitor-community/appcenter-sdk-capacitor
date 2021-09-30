import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(AnalyticsPlugin)
public class AnalyticsPlugin: CAPPlugin {
    private let implementation = AppCenterAnalyticsBase()
    
    public override func load() {
        
        AppCenterCapacitorShared.configureWithSettings()
        
        let config: NSDictionary = AppCenterCapacitorShared.getConfiguration()
        
        // get Analytics config options
        let enableInJs = config["AnalyticsEnableInJs"] as? Bool
        let transmissionInterval = config["AnalyticsTransmissionInterval"] as? UInt
        
        if AppCenterCapacitorShared.isSdkConfigured() {
            
            if transmissionInterval != nil {
                implementation.setTransmissionInterval(transmissionInterval!)
            }
            
            implementation.start()
            
            // disable auto start of Analytics
            if enableInJs ?? false {
                implementation.enable(false)
            }
        }
    }
    
    @objc func setEnabled(_ call: CAPPluginCall) {
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
        
        guard name.count != 0 else {
            call.reject("Must provide an event name")
            return
        }
        
        let properties = call.options["properties"] as? [String: String] ?? [:]
        let flag: String = call.getString("flag") ?? "none"
        
        implementation.trackEvent(name, properties, flag)
        
        call.resolve()
    }
}
