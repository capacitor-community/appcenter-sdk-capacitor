export interface AppCenterPlugin {
  /**
   * Returns AppCenter UUID.
   * For more info, please see: https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/cordova#identify-installations
   * @returns {Promise<string>} install id
   * @since 0.0.1
   */
  getInstallId(): Promise<string>;
  /**
   * Set a user ID that's used to augment crash reports.
   * For more info, please see: https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/cordova#identify-users
   * @param {string} userId Ex. "your-user-id"
   * @returns {Promise<void>}
   * @since 0.0.1
   */
  setUserId(options: {userId: string}): Promise<void>;
}
