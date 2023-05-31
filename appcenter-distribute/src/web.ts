import { WebPlugin } from '@capacitor/core';

import type { DistributePlugin } from './definitions';

export class DistributeWeb extends WebPlugin implements DistributePlugin {
  checkForUpdate(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  setEnabled(_options: { enable: boolean }): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  isEnabled(): Promise<{ value: boolean }> {
    throw this.unimplemented('Not supported on web.');
  }
}
