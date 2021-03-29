import { registerPlugin } from '@capacitor/core';

import type { AppCenterCrashesPlugin } from './definitions';

const AppCenterCrashes = registerPlugin<AppCenterCrashesPlugin>(
  'AppCenterCrashes',
  {
    web: () => import('./web').then(m => new m.AppCenterCrashesWeb()),
  },
);

export * from './definitions';
export { AppCenterCrashes };
