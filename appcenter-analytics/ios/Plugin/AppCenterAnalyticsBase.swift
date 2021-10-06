import Foundation
import Capacitor
import AppCenter
import AppCenterAnalytics

@objc public class AppCenterAnalyticsBase: NSObject {

    public func trackEvent(_ name: String, _ properties: [String: String]?, _ flag: String) {
        let analyticsFlag: Flags

        switch flag {
        case "critical":
            analyticsFlag = .critical
        case "normal":
            analyticsFlag = .normal
        default:
            analyticsFlag = .default
        }
        Analytics.trackEvent(name, withProperties: properties, flags: analyticsFlag)
    }

    public func setTransmissionInterval(_ seconds: UInt) {
        Analytics.transmissionInterval = seconds
    }

    public func start() {
        AppCenter.startService(Analytics.self)
    }

    public func pause() {
        Analytics.pause()
    }

    public func resume() {
        Analytics.resume()
    }

    public func enable(_ flag: Bool) {
        Analytics.enabled = flag
    }

    public func isEnabled() -> Bool {
        return Analytics.enabled
    }

}
