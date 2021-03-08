import Foundation
import Capacitor

@objc(AnalyticsPlugin)
public class AnalyticsPlugin: CAPPlugin {
    private let implementation = AppCenterAnalyticsBase()
    
    public override func load() {
        let appSecret = self.bridge!.config.getPluginConfigValue("AppCenterPlugin", "IOS_APP_SECRET") ?? ""
        let logInterval = self.bridge!.config.getPluginConfigValue("AppCenterPlugin", "transmissionInterval") as? UInt ?? 3
        
        implementation.setTransmissionInterval(logInterval)
        implementation.configureWithSettings(appSecret as! String)
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
}
