import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {
    private let implementation = AppCenterBase()

    override public func load() {
        AppCenterCapacitorShared.configureWithSettings()
    }

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getInstallId()])
    }

    @objc func setUserId(_ call: CAPPluginCall) {
        implementation.setUserId(call.getString("userId") ?? "")
        call.resolve()
    }

    @objc func getSdkVersion(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getSdkVersion()])
    }

    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isEnabled()])
    }

    @objc func setEnabled(_ call: CAPPluginCall) {
        implementation.enable(call.getBool("enabled") ?? false)
        call.resolve()
    }

    @objc func getLogLevel(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.getLogLevel()])
    }

    @objc func setLogLevel(_ call: CAPPluginCall) {
        guard let level = call.options["logLevel"] as? Int else {
            call.reject("Must provide LogLevel")
            return
        }

        implementation.setLogLevel(level)
        call.resolve()
    }

    @objc func setCustomProperties(_ call: CAPPluginCall) {
        call.unavailable("Not available in appcenter@2.0.0 or later.")
        //        guard let properties = call.options["properties"] as? [String: [String: Any]] else {
        //            implementation.setCustomProperties([:])
        //            call.resolve()
        //            return
        //        }
        //
        //        implementation.setCustomProperties(properties)
        //
        //        call.resolve()
    }

    @objc func setNetworkRequestsAllowed(_ call: CAPPluginCall) {
        implementation.setNetworkRequestsAllowed(call.getBool("isAllowed", true))
        call.resolve()
    }

    @objc func isNetworkRequestsAllowed(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isNetWorkRequestsAllowed()])
    }

    @objc func setCountryCode(_ call: CAPPluginCall) {
        implementation.setCountryCode(call.getString("countryCode") ?? "")
        call.resolve()
    }
}
