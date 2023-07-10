export class Client {
  constructor(config: ConfigurationOptions);

  public rollbar: Rollbar;

  public captureUncaughtExceptions(): void;
  public captureUnhandledRejections(): void;

  public log(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public debug(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public info(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public warning(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public error(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;
  public critical(obj: LogArgument, extra?: Extra, callback?: Callback): LogResult;

  public setPerson(id: string | null, name?: string | null, email?: string | null): void;
  public clearPerson(): void;
}

export class Configuration {
  constructor(options?: ConfigurationOptions);
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

export type Rollbar = import("rollbar").Rollbar;
export type ConfigurationOptions = import("rollbar").Configuration;
