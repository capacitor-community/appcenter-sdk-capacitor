#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(AppCenterPlugin, "AppCenter",
           CAP_PLUGIN_METHOD(getInstallId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setUserId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getSdkVersion, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(isEnabled, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(enable, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setCustomProperties, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getLogLevel, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setLogLevel, CAPPluginReturnPromise);

)
