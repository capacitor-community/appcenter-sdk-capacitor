import { WebPlugin } from '@capacitor/core';

import { AppCenterPlugin, LogLevel } from './definitions';

export class AppCenterWeb extends WebPlugin implements AppCenterPlugin {
  setEnabled(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  setNetworkRequestsAllowed(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  isNetworkRequestsAllowed(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  setLogLevel(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  getLogLevel(): Promise<{value: LogLevel}> {
    throw this.unimplemented('Not supported on web.');
  }
  setCustomProperties(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  isEnabled(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  getSdkVersion(): Promise<{ value: string; }> {
    throw this.unimplemented('Not supported on web.');
  }
  getInstallId(): Promise<{value: string}> {
    throw this.unimplemented('Not supported on web.');
  }
  setUserId(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
}