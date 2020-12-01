export class Client {
  constructor(config: Configuration | string);

  public captureUncaughtExceptions(): void;
  public captureUnhandledRejections(): void;

  public log(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public debug(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public info(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public warning(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public error(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public critical(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;

  public setPerson(id: string, name?: string, email?: string): void;
  public clearPerson(): void;
}

export class Configuration {
  constructor(accessToken: string, options?: ConfigurationOptions);
  public setPlatform(platform: string): void;
  public toJSON(): object;
}

export type LogArgument = string | Error | object | Callback | Date | any[];
export type Extra = object | undefined | null;
export interface LogResult {
    uuid: string;
}
export type MaybeError = Error | undefined | null;
export type Callback = (err: MaybeError, response: object) => void;

export interface ConfigurationOptions {
  environment?: string;
  logLevel?: string;
  reportLevel?: string;
  endpoint?: string;
  appVersion?: string;
  codeBundleId?: string;
  releaseStage?: string;
  enabledReleaseStages?: string[];
  captureUncaught?: boolean;
  captureUnhandledRejections?: boolean;
  captureDeviceInfo?: boolean;
  payload?: object;
  enabled?: boolean;
  verbose?: boolean;
  transform?: (data: object) => void;
}
