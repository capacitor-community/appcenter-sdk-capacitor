export interface DistributePlugin {
  /**
   * Sends a request to App Center and displays an update dialog in case there's a new release available. Note: A manual check for update call works even when automatic updates are enabled.
   * A manual check for update is ignored if another check is already being done. The manual check for update won't be processed if the user has postponed updates (unless the latest version is a mandatory update).
   * @returns {Promise<void>}
   * @since 1.0.0
   */
  checkForUpdate(): Promise<void>;
  /**
   * You can enable and disable App Center Distribute at runtime. If you disable it, the SDK won't provide any in-app update functionality but you can still use Distribute service in App Center portal.
   * @param {enable: boolean} options
   * @returns {Promise<void>}
   * @since 1.0.0
   */
  setEnabled(options: { enable: boolean }): Promise<void>;
  /**
   * Check if Distribute is enabled or not.
   * @returns {Promise<{value: boolean}>}
   * @since 1.0.0
   */
  isEnabled(): Promise<{ value: boolean }>;
}
