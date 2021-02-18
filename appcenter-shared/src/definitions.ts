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
   * @returns {Promise<{value: boolean}>} sdk version
   * @since 0.0.1
   */
  isEnabled(): Promise<{value: boolean}>;
  /**
   * Disable all services at runtime. When disabled, the SDK won't forward any information to App Center.
   * @param {enableFlag: boolean} options
   * @since 0.0.1
   */
  enable(options: {enableFlag: boolean}): Promise<void>;

  // customProperties(options: CustomProperties): Promise<void>
  // logLevel
  // setMaxStorageSize
}
