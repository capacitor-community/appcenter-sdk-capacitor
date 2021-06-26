import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(CrashesPlugin)
public class CrashesPlugin: CAPPlugin {
    
    private let implementation = AppCenterCrashesBase()
    
    public override func load() {
        // set crashes delegate
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
        DispatchQueue.main.async {
            call.resolve(["value": self.implementation.hasReceivedMemoryWarningInLastSession()])
        }
    }
    
    @objc func hasCrashedInLastSession(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            call.resolve(["value": self.implementation.hasCrashedInLastSession()])
        }
    }
    
    @objc func lastSessionCrashReport(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            guard let report = self.implementation.lastSessionCrashReport() else {
                call.reject("No crash report available")
                return
            }
            
            call.resolve(["value": report])
        }
    }
    
    @objc func notifyUserConfirmation(_ call: CAPPluginCall) {
        guard let userConfirm = call.options["userConfimation"] as? Int else {
            call.reject("Must provide a UserConfirmation")
            return
        }
        
        implementation.notifyUserConfirmation(confirmation: userConfirm)
        call.resolve()
    }

}
