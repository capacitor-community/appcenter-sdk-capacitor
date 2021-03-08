import { WebPlugin } from '@capacitor/core';

import type { AnalyticsPlugin } from './definitions';

export class AnalyticsWeb extends WebPlugin implements AnalyticsPlugin {
  pause(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  resume(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
  isEnabled(): Promise<{ value: boolean; }> {
    throw this.unimplemented('Not supported on web.');
  }
  enable(): Promise<void> {
    throw this.unimplemented('Not supported on web.');
  }
}