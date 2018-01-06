import { Platform, NativeModules } from 'react-native';

import Rollbar from 'rollbar/src/react-native/rollbar';

const NativeClient = NativeModules.RollbarReactNative;

export class Client {
  constructor(config) {
    if (config instanceof Configuration) {
      this.config = config;
    } else {
      this.config = new Configuration(config);
    }
    this.config.setPlatform(Platform.OS);

    this.rollbar = new Rollbar(this.config.toJSON());

    if (NativeClient) {
      NativeClient.init(this.config.toJSON());
      this.captureUncaughtExceptions();
      if (this.config.captureUnhandledRejections) {
        this.captureUnhandledRejections();
      }
    } else {
      throw new Error('Rollbar: Native client not found. Did you run react-native link?');
    }
  }

  captureUncaughtExceptions = () => {
		if (ErrorUtils) {
      const previousHandler = ErrorUtils.getGlobalHandler();

      ErrorUtils.setGlobalHandler((error, isFatal) => {
        if (this.config.captureUncaught && this.config.shouldSend()) {
          this.error(error, undefined, (queued) => {
            if (previousHandler) {
              previousHandler(error, isFatal);
            }
          });
        } else if (previousHandler) {
          previousHandler(error, isFatal);
        }
      });
    }
  }

  captureUnhandledRejections = () => {
		const tracking = require('promise/setimmediate/rejection-tracking');
    const client = this;
    tracking.enable({
      allRejections: true,
      onUnhandled: function(id, error) { client.error(error); },
      onHandled: function() {}
    });
  }

  log = (obj, extra, callback) => {
		if (!this.config.shouldSend()) {
      if (callback) {
        callback(false);
      }
      return;
    }

    this.rollbar.log(obj, extra, callback);
  }

  debug = (obj, extra, callback) => {
    return this.rollbar.debug(obj, extra, callback);
  }

  info = (obj, extra, callback) => {
    return this.rollbar.info(obj, extra, callback);
  }

  warning = (obj, extra, callback) => {
    return this.rollbar.warning(obj, extra, callback);
  }

  error = (obj, extra, callback) => {
    return this.rollbar.error(obj, extra, callback);
  }

  critical = (obj, extra, callback) => {
    return this.rollbar.critical(obj, extra, callback);
  }

  setPerson = (id, name, email) => {
    this.rollbar.setPerson({id, name, email});
    NativeClient.setPerson({id, name, email});
  }

  clearPerson = () => {
    this.rollbar.clearPerson();
    NativeClient.clearPerson();
  }
}

export class Configuration {
  constructor(accessToken, options) {
    options = options || {};
    const pkgData = require('../package.json');
    this.version = pkgData['version'];
    this.accessToken = accessToken;
    this.logLevel = options.logLevel || 'debug';
    this.reportLevel = options.reportLevel || 'debug';
    this.endpoint = options.endpoint || 'https://api.rollbar.com/api/1/item/';
    this.appVersion = options.appVersion || undefined;
    this.codeBundleId = options.codeBundleId || undefined;
    this.releaseStage = options.releaseStage || undefined;
    this.enabledReleaseStages = options.enabledReleaseStages || undefined;
    this.captureUncaught = options.captureUncaught !== undefined ? options.captureUncaught : true;
    this.captureUnhandledRejections = options.captureUnhandledRejections !== undefined ? options.captureUnhandledRejections : !__DEV__;
    this.payload = options.payload || {};
  }

  shouldSend = () => {
    return !this.releaseStage ||
      !this.enabledReleaseStages ||
      this.enabledReleaseStages.includes(this.releaseStage);
  }

  setPlatform = (platform) => {
    if (this.platform === undefined) {
      if (platform === 'ios' || platform === 'android') {
        this.platform = platform;
      } else {
        this.platform = 'client';
      }
    }
  }

  toJSON = () => {
    return {
      accessToken: this.accessToken,
      endpoint: this.endpoint,
      platform: this.platform,
      logLevel: this.logLevel,
      reportLevel: this.reportLevel,
      payload: {
        codeBundleId: this.codeBundleId,
        releaseStage: this.releaseStage,
        enabledReleaseStages: this.enabledReleaseStages,
        appVersion: this.appVersion,
        ...this.payload
      },
      notifier: {
        name: 'rollbar-react-native',
        version: this.version
      }
    };
  }
}
