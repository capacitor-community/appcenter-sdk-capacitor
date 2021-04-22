import Foundation
import Capacitor

@objc(AppCenterCrashesPlugin)
public class AppCenterCrashesPlugin: CAPPlugin {
    private let implementation = AppCenterCrashesBase()
    
    public override func load() {
            
        print("[AppCenterCrashesPlugin] load")
        
        let appSecret = self.bridge?.config.getString("AppCenter.iosAppSecret") ?? ""
        let enableInJs = getConfigValue("enableInJs") as? Bool ?? false
        
        implementation.configureWithSettings(appSecret)
        
        if enableInJs {
            // Avoid starting an analytics session since it will get enabled in JS
            implementation.enable(false)
        }
    }

    @objc func setEnable(_ call: CAPPluginCall) {
       implementation.enable(call.getBool("shouldEnable") ?? false)
        call.resolve()
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
       call.resolve(["value": implementation.isEnabled()])
        call.resolve()
    }
}
