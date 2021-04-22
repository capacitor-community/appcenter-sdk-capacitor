import { registerPlugin } from '@capacitor/core';

import type { CrashesPlugin } from './definitions';

const Crashes = registerPlugin<CrashesPlugin>(
  'Crashes',
  {
    web: () => import('./web').then(m => new m.CrashesWeb()),
  },
);

export * from './definitions';
export default Crashes;
