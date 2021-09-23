import Foundation
import Capacitor
import AppCenter
import AppCenterCrashes

@objc public class AppCenterCrashesBase: NSObject {
    
    public func trackException(_ exceptionObject: JSObject?, _ propertiesObject: JSObject?, _ attachmentsArray: [JSObject]?) throws -> String {
        let exceptionModel = try CrashesUtil.toExceptionModel(exceptionObject)
        let properties = propertiesObject as? [String: String] ?? nil
        let attachments = CrashesUtil.toErrorAttachmentLogs(attachmentsArray ?? [])
        
        
        return Crashes.trackException(exceptionModel, properties: properties, attachments: attachments)
    }
    
    public func trackError(_ error: Error, _ properties: [String: String]?, _ attachments: [ErrorAttachmentLog]?) {
        Crashes.trackError(error, properties: properties, attachments: attachments)
    }
   
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
