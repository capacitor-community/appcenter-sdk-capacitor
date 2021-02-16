import { WebPlugin } from '@capacitor/core';

import type { AppCenterPlugin } from './definitions';

export class AppCenterWeb extends WebPlugin implements AppCenterPlugin {
  getInstallId(): Promise<string> {
    throw this.unimplemented('Not supported on web.');
  }
  setUserId(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
}
