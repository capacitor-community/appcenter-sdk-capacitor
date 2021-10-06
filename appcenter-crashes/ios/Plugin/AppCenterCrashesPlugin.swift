import Foundation
import Capacitor
import AppCenterCapacitorShared

@objc(CrashesPlugin)
public class CrashesPlugin: CAPPlugin {

    private let implementation = AppCenterCrashesBase()

    override public func load() {

        print("[CrashesPlugin] load")

        AppCenterCapacitorShared.configureWithSettings()

        let config: NSDictionary = AppCenterCapacitorShared.getConfiguration()

        // get Crashes config options
        let alwaysSendCrashes = config["CrashesAlwaysSend"] as? Bool

        if AppCenterCapacitorShared.isSdkConfigured() {
            print("[CrashesPlugin] starting")
            implementation.start()
        }
    }

    @objc func trackError(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            let errorToTrack = call.getObject("error")
            let properties = call.getObject("properties")
            let attachments = call.getArray("attachments", JSObject.self)

            do {
                // We call trackException here and not trackError because the error is a custom exception
                // parsed from JS instead of a Throwable error
                let errorReportId = try self.implementation.trackException(errorToTrack, properties, attachments)
                call.resolve(["value": errorReportId])
            } catch CrashesUtil.ExceptionModelError.validationError(let message) {
                call.reject("Tracking error failed: \(message)")
            } catch {
                call.reject("Tracking error failed: \(error)")
            }
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

}
