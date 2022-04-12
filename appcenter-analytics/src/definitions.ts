export interface AnalyticsEvent {
  /**
   * 256 character limit
   */
  name: string;
  /**
   * Only 20 properties allowed per event
   */
  properties?: { [key: string]: string };
  flag?: 'normal' | 'critical';
}

export interface AnalyticsPlugin {
  /**
   * You can enable and disable App Center Analytics at runtime. If you disable it, the SDK won't collect any more analytics information for the app.
   * @param {enable: boolean} options
   * @returns {Promise<void>}
   * @since 0.3.0
   */
  setEnabled(options: { enable: boolean }): Promise<void>;
  /**
   * Check if Analytics is enabled or not.
   * @returns {Promise<{value: boolean}>}
   * @since 0.0.1
   */
  isEnabled(): Promise<{ value: boolean }>;
  /**
   * Pause transmission of Analytics logs. While paused, Analytics logs are saved to disk.
   * @returns {Promise<void>}
   * @since 0.1.0
   */
  pause(): Promise<void>;
  /**
   * Resume transmission of Analytics logs. Any Analytics logs that accumulated on disk while paused are sent to the server.
   * @returns {Promise<void>}
   * @since 0.1.0
   */
  resume(): Promise<void>;
  /**
   * Track an event with optional custom properties to know what's happening in your app, understand user actions, and see the aggregates in the App Center portal.
   * @param {AnalyticsEvent} options
   * @returns {Promise<void>}
   * @example
   * import Analytics from '@capacitor-community/appcenter-analytics';
   *
   * Analytics.trackEvent("Video Clicked")
   * Analytics.trackEvent('Video Clicked', {"Category" : "Music", "FileName" : "favorite.avi"}, flag: 'critical')
   * @since 0.1.0
   */
  trackEvent(options: AnalyticsEvent): Promise<void>;

  /**
   * Enable manual session tracker. Call this method before Analytics starts.
   * @returns {Promise<void>}
   * @since 2.0.0
   */
  enableManualSessionTracker(): Promise<void>;

  /**
   * Start a new session if manual session tracker is enabled, otherwise do nothing.
   * @returns {Promise<void>}
   * @since 2.0.0
   */
  startSession(): Promise<void>;
}
