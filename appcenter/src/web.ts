import { WebPlugin } from '@capacitor/core';

import type { AppCenterPlugin, LogLevel } from './definitions';

export class AppCenterWeb extends WebPlugin implements AppCenterPlugin {
  constructor() {
    super({
      name: 'AppCenter',
      platforms: ['web'],
    });
  }

  setEnabled(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  setNetworkRequestsAllowed(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  isNetworkRequestsAllowed(): Promise<{ value: boolean }> {
    throw new Error("Not supported on web.");
  }
  setLogLevel(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  getLogLevel(): Promise<{ value: LogLevel }> {
    throw new Error("Not supported on web.");
  }
  setCustomProperties(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  isEnabled(): Promise<{ value: boolean }> {
    throw new Error("Not supported on web.");
  }
  getSdkVersion(): Promise<{ value: string }> {
    throw new Error("Not supported on web.");
  }
  getInstallId(): Promise<{ value: string }> {
    throw new Error("Not supported on web.");
  }
  setUserId(): Promise<void> {
    throw new Error("Not supported on web.");
  }
}

const AppCenter = new AppCenterWeb();

export { AppCenter };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(AppCenter);
