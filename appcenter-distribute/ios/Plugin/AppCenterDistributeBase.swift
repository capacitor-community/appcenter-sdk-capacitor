import Foundation
import AppCenter
import AppCenterDistribute

@objc public class AppCenterDistributeBase: NSObject {
    public func start() {
        #if !DEBUG
            AppCenter.startService(Distribute.self)
        #endif
    }
    public func checkForUpdate() {
        Distribute.checkForUpdate()
    }
    public func enable(_ flag: Bool) {
        Distribute.enabled = flag
    }
    public func isEnabled() -> Bool {
        return Distribute.enabled
    }
}
