import { registerPlugin } from '@capacitor/core';

import type { AppCenterPlugin } from './definitions';

const AppCenter = registerPlugin<AppCenterPlugin>('AppCenter', {
  web: () => import('./web').then(m => new m.AppCenterWeb()),
});

export * from './definitions';
export default AppCenter;
