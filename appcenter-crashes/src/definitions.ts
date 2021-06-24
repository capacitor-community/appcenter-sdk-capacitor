export enum UserConfirmation {
  DONT_SEND = 0,
  SEND = 1,
  ALWAYS_SEND = 2
}

export interface Device {
  /** 
   * Name of the SDK. Consists of the name of the SDK and the platform, e.g. "appcenter.ios", "appcenter.android" 
   */
  sdkName: string;
  /**
   * Version of the SDK in semver format, e.g. "1.2.0" or "0.12.3-alpha.1". 
   */
  sdkVersion: string;
  /**
   * Device model (example: iPad2,3). 
   */
  model: string;
  /**
   * Device manufacturer (example: HTC). 
   */
  oemName: string;
  /**
   * OS name (example: iOS). 
   */
  osName: string;
  /**
   * OS version (example: 9.3.0). 
   */
  osVersion: string;
  /**
   * OS build code (example: LMY47X). 
   */
  osBuild?: string;
  /**
   * API level when applicable like in Android (example: 15). 
   */
  osApiLevel?: number;
  /**
   * Language code (example: en_US). 
   */
  locale: string;
  /**
   * The offset in minutes from UTC for the device time zone, including daylight savings time. 
   */
  timeZoneOffset: number;
  /**
   * Screen size of the device in pixels (example: 640x480). 
   */
  screenSize: string;
  /**
   * Application version name, e.g. 1.1.0 
   */
  appVersion: string;
  /**
   * Carrier name (for mobile devices). 
   */
  carrierName?: string;
  /**
   * Carrier country code (for mobile devices). 
   */
  carrierCountry?: string;
  /**
   * The app's build number, e.g. 42. 
   */
  appBuild: string;
  /**
   * The bundle identifier, package identifier, or namespace, depending on what the individual plattforms use,  .e.g com.microsoft.example. 
   */
  appNamespace?: string;
}

export interface ErrorReport {
  /**
   * UUID for the crash report. 
   */
  id: string;
  threadName?: string;
  /**
   * Date and time the error occurred. 
   */
  appErrorTime?: string | number;
  /**
   * Date and time the app started. 
   */
  appStartTime?: string | number;
  /**
   * Exception name that triggered the crash. 
   */
  exceptionName?: string;
  /**
   * Exception reason. 
   */
  exceptionReason?: string;
  /**
   * Device information of the app when it crashed. 
   */
  device: Device;
  /**
   * Signal that caused the crash. 
   */
  signal: string;
  /**
   * Identifier of the app process that crashed. 
   */
  appProcessIdentifier: number;
}

export interface CrashesListener {
  onBeforeSending?: (report: ErrorReport) => void;
  onSendingSucceeded?: (report: ErrorReport) => void;
  onSendingFailed?: (report: ErrorReport) => void;
  getErrorAttachments?: (report: ErrorReport) => Promise<ErrorAttachmentLog[]>;
  shouldProcess?: (report: ErrorReport) => boolean;
  shouldAwaitUserConfirmation?: () => boolean;
}

export class ErrorAttachmentLog {
  /**
   * Create text attachment for an error report
   */
  public static attachmentWithText(text: string, fileName?: string): ErrorAttachmentLog {
    return { text, fileName };
  }
  /**
   * Create binary attachment for an error report, binary must be passed as a base64 string
   */
  public static attachmentWithBinary(
    data: string,
    fileName: string | null,
    contentType: string
  ): ErrorAttachmentLog {
    return { data, fileName, contentType };
  }
}

export interface CrashesPlugin {
  /**
   * Check if Crashes is enabled or not.
   * @returns {Promise<{value: boolean}>}
   * @since 0.1.0
   * @example
   * import Crashes from '@capacitor-community/appcenter-crashes';
   *
   * const { value: enabled } = await Crashes.isEnabled();
   */
   isEnabled(): Promise<{value: boolean}>;

   /**
    * You can enable and disable App Center Crashes at runtime. If you disable it, the SDK won't do any crash reporting for the app.
    * The state is persisted in the device's storage across application launches.
    * @param {shouldEnable: boolean} options
    * @since 0.1.0
    * @example
    * import Crashes from '@capacitor-community/appcenter-crashes';
    * 
    * await Crashes.enable({shouldEnable: true});
    */
   setEnabled(options: {shouldEnable: boolean}): Promise<void>;

   /**
    * Generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.
    * @since 0.2.0
    * @example
    * import Crashes from '@capacitor-community/appcenter-crashes';
    * 
    * await Crashes.generateTestCrash();
    */
   generateTestCrash(): Promise<void>;

   /**
    * Check if app recieved memory warning in the last session.
    * @returns {Promise<{value: boolean}>}
    * @since 0.2.0
    * @example
    * import Crashes from '@capacitor-community/appcenter-crashes';
    * 
    * const { value: gotMemWarning } = await Crashes.hasReceivedMemoryWarningInLastSession();
    */
   hasReceivedMemoryWarningInLastSession(): Promise<{value: boolean}>;

   /**
    * Check if the app has crashed in the last session.
    * @returns {Promise<{value: boolean}>}
    * @since 0.3.0
    * @example
    * import Crashes from '@capacitor-community/appcenter-crashes';
    * 
    * const { value: hasCrashed } = await Crashes.hasCrashedInLastSession();
    */
    hasCrashedInLastSession(): Promise<{value: boolean}>;

    /**
     * Provides details about the crash that occurred in the last app session.
     * @returns {Promise<{value: ErrorReport}>}
     * @since 0.3.0
     * @example
     * import Crashes from '@capacitor-community/appcenter-crashes';
     * 
     * const { value: crashReport } = await Crashes.lastSessionCrashReport();
     */
    lastSessionCrashReport(): Promise<{value: ErrorReport}>;
}

// convert
// export function notifyUserConfirmation(userConfirmation: UserConfirmation): void;
// export function setListener(crashesListener: CrashesListener): Promise<void>;
