import { registerPlugin } from '@capacitor/core';

import type { AnalyticsPlugin } from './definitions';

const Analytics = registerPlugin<AnalyticsPlugin>('Analytics', {
  web: () => import('./web').then(m => new m.AnalyticsWeb()),
});

export * from './definitions';
export { Analytics };
