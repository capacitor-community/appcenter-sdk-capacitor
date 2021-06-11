import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(CrashesPlugin)
public class CrashesPlugin: CAPPlugin {
    
    private let implementation = AppCenterCrashesBase()
    
    public override func load() {
            
        print("[CrashesPlugin] load")
        
        AppCenterCapacitorShared.configureWithSettings()
                
        let config: NSDictionary = AppCenterCapacitorShared.getConfiguration()
        
        // get Crashes config options
        let enableInJs = config["CrashesEnableInJs"] as? Bool
        let alwaysSendCrashes = config["CrashesAlwaysSend"] as? Bool
        
        if AppCenterCapacitorShared.isSdkConfigured() {
            
            implementation.start()
            
            // disable auto start of Crashes
            if enableInJs ?? false {
                implementation.enable(false)
            }
        }
    }

    @objc func setEnabled(_ call: CAPPluginCall) {
        implementation.enable(call.getBool("shouldEnable") ?? false)
        call.resolve()
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isEnabled()])
        call.resolve()
    }
    
    @objc func generateTestCrash(_ call: CAPPluginCall) {
        implementation.generateTestCrash()
        call.resolve()
    }
}
