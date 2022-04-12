import { WebPlugin } from '@capacitor/core';

import type { AnalyticsPlugin } from './definitions';

export class AnalyticsWeb extends WebPlugin implements AnalyticsPlugin {
  enableManualSessionTracker(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  startSession(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  setEnabled(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  trackEvent(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  pause(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  resume(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  isEnabled(): Promise<{ value: boolean }> {
    throw this.unimplemented('Not supported on web.');
  }
}
