#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(CrashesPlugin, "Crashes",
           CAP_PLUGIN_METHOD(trackError, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setEnabled, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(isEnabled, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(generateTestCrash, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(hasReceivedMemoryWarningInLastSession, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(hasCrashedInLastSession, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(lastSessionCrashReport, CAPPluginReturnPromise);

)
