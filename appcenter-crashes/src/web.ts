import { WebPlugin } from '@capacitor/core';
import { CrashesPlugin, ErrorReport } from './definitions';

export class CrashesWeb extends WebPlugin implements CrashesPlugin {
  constructor() {
    super({
      name: 'CrashesPlugin',
      platforms: ['web'],
    });
  }
  trackError(): Promise<{ value: string }> {
    throw new Error("Not supported on web.");
  }
  lastSessionCrashReport(): Promise<{ value: ErrorReport }> {
    throw new Error("Not supported on web.");
  }
  hasCrashedInLastSession(): Promise<{ value: boolean }> {
    throw new Error("Not supported on web.");
  }
  hasReceivedMemoryWarningInLastSession(): Promise<{ value: boolean }> {
    throw new Error("Not supported on web.");
  }
  generateTestCrash(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  isEnabled(): Promise<{ value: boolean }> {
    throw new Error("Not supported on web.");
  }
  setEnabled(): Promise<void> {
    throw new Error("Not supported on web.");
  }
}

const Crashes = new CrashesWeb();

export { Crashes };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(Crashes);

