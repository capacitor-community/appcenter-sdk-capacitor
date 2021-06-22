export enum LogLevel {
  /* Logging will be very chatty */
  VERBOSE = 2,
  /* Debug information will be logged */
  DEBUG = 3,
  /* Information will be logged */
  INFO = 4,
  /* Errors and warning will be logged */
  WARNING = 5,
  /* Errors will be logged */
  ERROR = 6,
  /* Only critical errors will be logged */
  ASSERT = 7,
  /* Logging is disabled */
  NONE = 99
}

interface ICustomProperties {
  set(key: string, value: string | number | boolean | Date): CustomProperties;
  clear(key: string): CustomProperties;
}

/**
 * App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. 
 * For instance, you can use custom properties to segment your users, and then send push notifications to a specific audience.
 */
export class CustomProperties implements ICustomProperties {
  [key: string]: any;
  /**
   * Set a custom property
   * @param {string} key 
   * @param {string | number | boolean | Date} value 
   * @returns {CustomProperties}
   * @example
   * import { CustomProperties } from '@capacitor-community/appcenter';
   * 
   * const properties = new CustomProperties();
   * properties.set('color', 'blue').set('score', 10);
   * AppCenter.setCustomProperties(properties);
   */
  set(key: string, value: string | number | boolean | Date): CustomProperties {
    const type = typeof value;
    switch (type) {
      case 'string':
      case 'number':
      case 'boolean':
        this[key] = { type, value };
        break;
      case 'object':
        if (value instanceof Date) {
          this[key] = { type: 'date-time', value: value.getTime() };
        }
        break;
      default:
        console.error('CustomProperties: Invalid value type, expected string|number|boolean|Date.')
    }
    return this;
  }
  /**
   * Remove a custom property. This only removes the value of the property for a device. It won't remove the property name from App Center portal.
   * @param {string} key 
   * @returns {CustomProperties}
   * @example
   * import { CustomProperties } from '@capacitor-community/appcenter';
   * 
   * const properties = new CustomProperties();
   * properties.clear('score');
   * AppCenter.setCustomProperties(properties);
   */
  clear(key: string): CustomProperties {
    this[key] = { type: 'clear' };
    return this;
  }
}

export interface AppCenterPlugin {
  /**
   * Returns AppCenter unique installation identifier.
   * @returns {Promise<{value: string}>} install id
   * @since 0.0.1
   * @example
   * import AppCenter from '@capacitor-community/appcenter';

   * const { value: installId } = await AppCenter.getInstallId();
   */
  getInstallId(): Promise<{value: string}>;
  /**
   * Set a user ID that's used to augment crash reports.
   * @param {{userId: string}} options Ex. "your-user-id"
   * @returns {Promise<void>}
   * @since 0.0.1
   * @example
   * import AppCenter from '@capacitor-community/appcenter';

   * await AppCenter.setUserId({userId: 'your-user-id'})
   */
  setUserId(options: {userId: string}): Promise<void>;

  /**
   * Get the version of the native App Center SDK
   * @returns {Promise<{value: string}>} sdk version
   * @since 0.0.1
   * @example
   * import AppCenter from '@capacitor-community/appcenter';

   * const { value: sdkVersion } = await AppCenter.getSdkVersion();
   */
  getSdkVersion(): Promise<{value: string}>;

  /**
   * Check if App Center is enabled or not as a whole.
   * @returns {Promise<{value: boolean}>}
   * @since 0.0.1
   * @example
   * import AppCenter from '@capacitor-community/appcenter';

   * const { value: sdkEnabled } = await AppCenter.isEnabled();
   */
  isEnabled(): Promise<{value: boolean}>;

  /**
   * Toggle all App Center services at runtime. When disabled, the SDK won't forward any information to App Center.
   * @param {{shouldEnable: boolean}} options
   * @since 0.4.0
   * @example
   * import AppCenter from '@capacitor-community/appcenter';

   * await AppCenter.setEnable({shouldEnable: true});
   */
  setEnable(options: {shouldEnable: boolean}): Promise<void>;

  /**
   * App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. 
   * For instance, you can use custom properties to segment your users, and then send push notifications to a specific audience.
   * @param {{properties: CustomProperties}} options
   * @since 0.2.0
   * @example
   * import AppCenter, { CustomProperties } from '@capacitor-community/appcenter';
   * 
   * const properties = new CustomProperties();
   * properties.set('color', 'blue').set('score', 10);
   * AppCenter.setCustomProperties(properties);
   */
  setCustomProperties(options: {properties: CustomProperties}): Promise<void>

  /**
   * Returns currently set LogLevel.
   * @returns {Promise<{value: LogLevel}>} AppCenter LogLevel
   * @since 0.2.0
   * @example
   * import AppCenter from '@capacitor-community/appcenter';
   * 
   * const {value: logLevel} = await AppCenter.getLogLevel()
   */
  getLogLevel(): Promise<{value: LogLevel}>;

  /**
   * You can control the amount of log messages that show up from App Center in the console. Log messages show in the console on iOS and LogCat on Android.
   * By default, it's set to Assert for the App Store environment and Warning otherwise. To have as many log messages as possible, use Verbose. 
   * Note: `setLogLevel` API can't increase logging for app startup code, before JavaScript is loaded.
   * @param {logLevel: LogLevel} options
   * @since 0.2.0
   * @example
   * import AppCenter, { LogLevel } from '@capacitor-community/appcenter';
   * 
   * await AppCenter.setLogLevel({logLevel: LogLevel.DEBUG})
   */
  setLogLevel(options: {logLevel: LogLevel}): Promise<void>;

  /**
   * Flag indicating whether SDK can send network requests.
   * @param {{shouldAllow: boolean}} options
   * @returns {Promise<{value: boolean}>}
   * @since 0.4.0
   * @example
   * import AppCenterfrom '@capacitor-community/appcenter';
   * 
   * const {value: allowed} = await AppCenter.networkRequestsAllowed({shouldAllow: true})
   */
  networkRequestsAllowed(options?: {shouldAllow: boolean}): Promise<{value: boolean}>

  // move to confg setting in appcenter-analytics
  // setMaxStorageSize
}