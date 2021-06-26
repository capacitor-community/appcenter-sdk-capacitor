import { WebPlugin } from '@capacitor/core';

import { CrashesPlugin, ErrorReport } from './definitions';

export class CrashesWeb
  extends WebPlugin
  implements CrashesPlugin {
  notifyUserConfirmation(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  lastSessionCrashReport(): Promise<{ value: ErrorReport; }> {
    throw this.unimplemented('Not supported on web.');
  }
  hasCrashedInLastSession(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  hasReceivedMemoryWarningInLastSession(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  generateTestCrash(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  isEnabled(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  setEnabled(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
}
