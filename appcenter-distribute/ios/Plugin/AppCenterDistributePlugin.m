#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(DistributePlugin, "Distribute",
           CAP_PLUGIN_METHOD(checkForUpdate, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(setEnabled, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(isEnabled, CAPPluginReturnPromise);
)
