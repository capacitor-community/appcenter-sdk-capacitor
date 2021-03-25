import { WebPlugin } from '@capacitor/core';

import { AppCenterPlugin } from './definitions';

export class AppCenterWeb extends WebPlugin implements AppCenterPlugin {
  setCustomProperties(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  enable(): Promise<void> {
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