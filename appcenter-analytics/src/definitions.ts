export interface AnalyticsPlugin {
  /**
   * You can enable and disable App Center Analytics at runtime. If you disable it, the SDK won't collect any more analytics information for the app.
   * @param {enableFlag: boolean} options
   * @since 0.1.0
   */
  enable(options: {enableFlag: boolean}): Promise<void>;
  /**
   * Check if Analytics is enabled or not.
   * @returns {Promise<{value: boolean}>} 
   * @since 0.0.1
   */
  isEnabled(): Promise<{value: boolean}>;
  /**
   * Pause transmission of Analytics logs. While paused, Analytics logs are saved to disk.
   * @since 0.1.0
   */
  pause(): Promise<void>;
  /**
   * Resume transmission of Analytics logs. Any Analytics logs that accumulated on disk while paused are sent to the server.
   * @since 0.1.0
   */
  resume(): Promise<void>;
}
