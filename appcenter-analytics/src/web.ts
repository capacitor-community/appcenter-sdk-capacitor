import { WebPlugin } from '@capacitor/core';
import { AnalyticsPlugin } from './definitions';

export class AnalyticsWeb extends WebPlugin implements AnalyticsPlugin {

  constructor() {
    super({
      name: 'Analytics',
      platforms: ['web'],
    });
  }
  
  setEnabled(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  trackEvent(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  pause(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  resume(): Promise<void> {
    throw new Error("Not supported on web.");
  }
  isEnabled(): Promise<{ value: boolean }> {
    throw new Error("Not supported on web.");
  }
}

const Analytics = new AnalyticsWeb();

export { Analytics };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(Analytics);

