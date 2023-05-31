import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(DistributePlugin)
public class DistributePlugin: CAPPlugin {
    private let implementation = AppCenterDistributeBase()

    override public func load() {
        print("[DistributePlugin] load")

        AppCenterCapacitorShared.configureWithSettings()

        let config: NSDictionary = AppCenterCapacitorShared.getConfiguration()

        // get Distribute config options
        let disableAutomaticCheckForUpdate = config["DistributeDisableAutomaticCheckForUpdate"] as? Bool
        // DistributeUpdateTrack
        let updateTrack = config["DistributeUpdateTrack"] as? String

        // TODO: use config options
        if AppCenterCapacitorShared.isSdkConfigured() {
            print("[DistributePlugin] starting")
            implementation.start()
        }
    }

    @objc func checkForUpdate(_ call: CAPPluginCall) {
        implementation.checkForUpdate()
        call.resolve()
    }

    @objc func setEnabled(_ call: CAPPluginCall) {
        implementation.enable(call.getBool("enable") ?? false)
        call.resolve()
    }

    @objc func isEnabled(_ call: CAPPluginCall) {
        call.resolve(["value": implementation.isEnabled()])
    }
}
