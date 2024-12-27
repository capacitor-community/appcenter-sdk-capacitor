import XCTest
@testable import AppCenterCapacitorShared
import AppCenter

class AppCenterCapacitorSharedTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Reset shared state before each test
        AppCenterCapacitorShared.startAutomatically = true
        AppCenterCapacitorShared.configuration = [:]
        AppCenterCapacitorShared.appSecret = nil
        AppCenterCapacitorShared.logLevel = nil
        AppCenterCapacitorShared.wrapperSdk = nil
    }

    func testIsSdkConfigured() {
        // Initially, the SDK should not be configured
        XCTAssertFalse(AppCenterCapacitorShared.isSdkConfigured())
    }

    func testSetStartAutomatically() {
        AppCenterCapacitorShared.setStartAutomatically(false)
        XCTAssertFalse(AppCenterCapacitorShared.startAutomatically)
    }

    func testSetAppSecret() {
        let secret = "test-secret"
        AppCenterCapacitorShared.setAppSecret(secret)
        XCTAssertEqual(AppCenterCapacitorShared.appSecret, secret)
    }

    func testConfigureWithSettings() {
        // Test without app secret
        AppCenterCapacitorShared.configureWithSettings()
        XCTAssertTrue(AppCenter.isConfigured)

        // Test with app secret
        let secret = "test-secret"
        AppCenterCapacitorShared.setAppSecret(secret)
        AppCenterCapacitorShared.configureWithSettings()
        XCTAssertTrue(AppCenter.isConfigured)
    }

    func testGetConfiguration() {
        let config = AppCenterCapacitorShared.getConfiguration()
        XCTAssertEqual(config, [:])
    }

    func testGetWrapperSdk() {
        XCTAssertNil(AppCenterCapacitorShared.getWrapperSdk())
    }

    func testSetWrapperSdk() {
        let wrapperSdk = WrapperSdk(wrapperSdkVersion: "5.0.0",
                                    wrapperSdkName: "appcenter.capacitor",
                                    wrapperRuntimeVersion: nil,
                                    liveUpdateReleaseLabel: nil,
                                    liveUpdateDeploymentKey: nil,
                                    liveUpdatePackageHash: nil)
        AppCenterCapacitorShared.setWrapperSdk(wrapperSdk)
        XCTAssertEqual(AppCenterCapacitorShared.getWrapperSdk(), wrapperSdk)
    }
}
