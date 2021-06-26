import Foundation
import Capacitor
import AppCenter
import AppCenterCrashes

@objc public class AppCenterCrashesBase: NSObject {
    
    static let kMSACUserConfirmationDontSendJS = 0;
    static let kMSACUserConfirmationSendJS = 1;
    static let kMSACUserConfirmationAlwaysSendJS = 2;
   
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
    
    public func notifyUserConfirmation(confirmation: Int) {
        switch confirmation {
            case AppCenterCrashesBase.kMSACUserConfirmationDontSendJS:
                Crashes.notify(with: UserConfirmation.dontSend)
            case AppCenterCrashesBase.kMSACUserConfirmationSendJS:
                Crashes.notify(with: UserConfirmation.send)
            case AppCenterCrashesBase.kMSACUserConfirmationAlwaysSendJS:
                Crashes.notify(with: UserConfirmation.always)
            default:
                Crashes.notify(with: UserConfirmation.send)
        }
    }

}
