#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(AppCenterPlugin, "AppCenter",
           CAP_PLUGIN_METHOD(getInstallId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setUserId, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(getSdkVersion, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(isEnabled, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setEnable, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(setCustomProperties, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(getLogLevel, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setLogLevel, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(setNetworkRequestsAllowed, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(isNetworkRequestsAllowed, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setCountryCode, CAPPluginReturnNone);
)
