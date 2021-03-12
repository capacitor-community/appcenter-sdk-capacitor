export enum LogLevel {
  /* Only critical errors will be logged */
  assert = 7,
  /* Debug information will be logged */
  debug = 3,
  /* Errors will be logged */
  error = 6,
  /* Information will be logged */
  info = 4,
  /* Logging is disabled */
  none = 99,
  /* Logging will be very chatty */
  verbose = 2,
  /* Errors and warning will be logged */
  warning = 5
}

export type LogLevelString = keyof typeof LogLevel;

export interface CustomProperties {
  [key: string]: string | number | boolean;
}

export interface AppCenterPlugin {
  /**
   * Returns AppCenter UUID.
   * For more info, please see: https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/cordova#identify-installations
   * @returns {Promise<{value: string}>} install id
   * @since 0.0.1
   */
  getInstallId(): Promise<{value: string}>;
  /**
   * Set a user ID that's used to augment crash reports.
   * For more info, please see: https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/cordova#identify-users
   * @param {userId: string} options Ex. "your-user-id"
   * @returns {Promise<void>}
   * @since 0.0.1
   */
  setUserId(options: {userId: string}): Promise<void>;
  /**
   * Get the version of App Center SDK
   * @returns {Promise<{value: string}>} sdk version
   * @since 0.0.1
   */
  getSdkVersion(): Promise<{value: string}>;
  /**
   * Check if App Center is enabled or not as a whole.
   * @returns {Promise<{value: boolean}>}
   * @since 0.0.1
   */
  isEnabled(): Promise<{value: boolean}>;
  /**
   * Toggle all App Center services at runtime. When disabled, the SDK won't forward any information to App Center.
   * @param {enableFlag: boolean} options
   * @since 0.0.1
   */
  enable(options: {enableFlag: boolean}): Promise<void>;

  /**
   * You can control the amount of log messages that show up from App Center in the console. By default, it's set to Assert for the App Store environment and Warning otherwise. To have as many log messages as possible, use Verbose.
   * @param {logLevel: LogLevel} options 
   * @since 0.1.1
   */
  // setLogLevel(options: {logLevel: LogLevel}): Promise<void>;
  // customProperties(options: CustomProperties): Promise<void>
  // setMaxStorageSize
}