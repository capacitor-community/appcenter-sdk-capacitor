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
        let alwaysSendCrashes = config["CrashesAlwaysSend"] as? Bool
        
        if AppCenterCapacitorShared.isSdkConfigured() {
            implementation.start()
        }
    }

    @objc func setEnabled(_ call: CAPPluginCall) {
        implementation.enable(call.getBool("shouldEnable") ?? false)
        call.resolve()
    }
    
    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isEnabled()])
    }
    
    @objc func generateTestCrash(_ call: CAPPluginCall) {
        implementation.generateTestCrash()
        call.resolve()
    }
    
    @objc func hasReceivedMemoryWarningInLastSession(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.hasReceivedMemoryWarningInLastSession()])
    }
}
