import { WebPlugin } from '@capacitor/core';

import { AppCenterPlugin } from './definitions';

export class AppCenterWeb extends WebPlugin implements AppCenterPlugin {
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