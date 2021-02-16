import Foundation
import Capacitor
import AppCenter

@objc(AppCenterPlugin)
public class AppCenterPlugin: CAPPlugin {

    @objc func getInstallId(_ call: CAPPluginCall) {
        call.resolve(["value": AppCenter.installId.uuidString])
    }

    @objc func setUserId(_ call: CAPPluginCall) {
        AppCenter.userId = call.getString("userId") ?? ""
        call.resolve()
    }
}
