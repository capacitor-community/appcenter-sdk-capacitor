import Foundation
import Capacitor

import AppCenter

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {
    private let implementation = AppCenter()

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.installId])
    }

    @objc func setUserId(_ call: CAPPluginCall) {
        let userId = call.getString("userId") ?? ""
        AppCenter.userId = userId
        call.resolve()
    }
}
