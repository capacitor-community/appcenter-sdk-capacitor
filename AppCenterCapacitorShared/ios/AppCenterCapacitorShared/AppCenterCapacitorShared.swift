import Foundation
import AppCenter

public class AppCenterCapacitorShared: NSObject {

    static var startAutomatically: Bool = true
    static var configuration: NSDictionary = [:]
    static var appSecret: String?
    static var logLevel: UInt?
    static var wrapperSdk: WrapperSdk?
    // plist keys
    static var kAppCenterSecretKey = "AppSecret"
    static var kAppCenterStartAutomaticallyKey = "StartAutomatically"
    static var kAppCenterLogLevelKey = "LogLevel"
    static var kAppCenterConfigResource = "AppCenter-Config"

    public static func isSdkConfigured() -> Bool {
        return AppCenter.isConfigured
    }

    public static func getConfiguration() -> NSDictionary {
        return configuration
    }

    public static func setStartAutomatically (_ shouldStartAutomatically: Bool) {
        startAutomatically = shouldStartAutomatically
    }

    public static func configureWithSettings() {
        if AppCenter.isConfigured {
            return
        }

        let tempWrapperSdk = WrapperSdk(wrapperSdkVersion: "0.3.5",
            wrapperSdkName: "appcenter.capacitor",
            wrapperRuntimeVersion: nil,
            liveUpdateReleaseLabel: nil,
            liveUpdateDeploymentKey: nil,
            liveUpdatePackageHash: nil)

        if let actualWrapperSdk = tempWrapperSdk {
            setWrapperSdk(actualWrapperSdk)
        }
        getSdkConfig()

        if startAutomatically {
            if let actualSecret = appSecret, actualSecret.count != 0 {
                AppCenter.configure(withAppSecret: actualSecret)
            } else {
                AppCenter.configure()
            }

            // set log level if specified
            if let actualLogLevel = logLevel {
                AppCenter.logLevel = LogLevel.init(rawValue: actualLogLevel) ?? .assert
            }
        }
    }

    public static func setAppSecret(_ secret: String) {
        appSecret = secret
    }

    public static func getSdkConfig() {
        if appSecret == nil {
            // get config plist
            if let plist = Bundle.main.path(forResource: AppCenterCapacitorShared.kAppCenterConfigResource, ofType: "plist") {
                configuration = NSDictionary(contentsOfFile: plist) ?? [:]

                // get appSecret key
                appSecret = configuration[AppCenterCapacitorShared.kAppCenterSecretKey] as? String

                // get log level
                logLevel = configuration[AppCenterCapacitorShared.kAppCenterLogLevelKey] as? UInt

                // start automatically flag true by default
                if let rawStartAutomatically = configuration[AppCenterCapacitorShared.kAppCenterStartAutomaticallyKey] as? Bool {
                    startAutomatically = rawStartAutomatically
                }
            }
        }
    }

    public static func getWrapperSdk() -> WrapperSdk? {
        return wrapperSdk
    }

    public static func setWrapperSdk(_ sdk: WrapperSdk) {
        wrapperSdk = sdk
        AppCenter.wrapperSdk = sdk
    }

}
