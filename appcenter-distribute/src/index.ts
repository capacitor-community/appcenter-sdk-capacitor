import { registerPlugin } from '@capacitor/core';

import type { DistributePlugin } from './definitions';

const Distribute = registerPlugin<DistributePlugin>('DistributePlugin', {
  web: () => import('./web').then(m => new m.DistributeWeb()),
});

export * from './definitions';
export default Distribute;
