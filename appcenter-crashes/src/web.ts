import { WebPlugin } from '@capacitor/core';

import type { AppCenterCrashesPlugin } from './definitions';

export class AppCenterCrashesWeb
  extends WebPlugin
  implements AppCenterCrashesPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
