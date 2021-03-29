export interface AppCenterCrashesPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
