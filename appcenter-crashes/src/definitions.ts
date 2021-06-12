export enum UserConfirmation {
  DONT_SEND = 0,
  SEND = 1,
  ALWAYS_SEND = 2
}

export interface Device {
  sdkName: string;
  sdkVersion: string;
  model: string;
  oemName: string;
  osName: string;
  osVersion: string;
  osBuild: string;
  osApiLevel?: number;
  locale: string;
  timeZoneOffset: number;
  screenSize?: string;
  appVersion: string;
  carrierName?: string;
  carrierCountry?: string;
  appBuild: string;
  appNamespace: string;
}

export interface ErrorReport {
  id: string;
  threadName?: string;
  appErrorTime: string | number;
  appStartTime: string | number;
  exception?: string;
  exceptionReason?: string;
  device: Device;
  signal?: string;
  appProcessIdentifier?: number;
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
  // Create text attachment for an error report
  public static attachmentWithText(text: string, fileName?: string): ErrorAttachmentLog {
    return { text, fileName };
  }
  // Create binary attachment for an error report, binary must be passed as a base64 string
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
    hasCrashedInLastSession(): Promise<{ value: boolean}>;
}

// convert
// export function lastSessionCrashReport(): Promise<ErrorReport>;
// export function notifyUserConfirmation(userConfirmation: UserConfirmation): void;
// export function setListener(crashesListener: CrashesListener): Promise<void>;
