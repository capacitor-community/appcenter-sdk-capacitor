import { WebPlugin } from '@capacitor/core';

import type { CrashesPlugin } from './definitions';

export class CrashesWeb
  extends WebPlugin
  implements CrashesPlugin {
  isEnabled(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  setEnabled(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
}
