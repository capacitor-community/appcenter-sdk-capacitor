import Foundation
import Capacitor
import AppCenter
import AppCenterCrashes

@objc public class AppCenterCrashesBase: NSObject {
   
    public func enable(_ flag: Bool) {
        Crashes.enabled = flag
    }
   
    public func isEnabled() -> Bool {
        return Crashes.enabled
    }
    
    public func start() {
        AppCenter.startService(Crashes.self)
    }
    
    public func generateTestCrash() {
        Crashes.generateTestCrash()
    }
    
    public func hasReceivedMemoryWarningInLastSession() -> Bool {
        return Crashes.hasReceivedMemoryWarningInLastSession
    }
    
    public func hasCrashedInLastSession() -> Bool {
        return Crashes.hasCrashedInLastSession
    }
    
    public func lastSessionCrashReport() -> Dictionary<String, Any>? {
        return CrashesUtil.convertReportToJs(report: Crashes.lastSessionCrashReport)
    }
}
