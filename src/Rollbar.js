import { NativeModules } from 'react-native';

import Rollbar from 'rollbar/src/react-native/rollbar';

const NativeClient = NativeModules.RollbarReactNative;

export class Client {
  constructor(config) {
    if (config instanceof Configuration) {
      this.config = config;
    } else {
      this.config = new Configuration(config);
    }

    console.log('before break: ', this.config.toJSON());
    this.rollbar = new Rollbar(this.config.toJSON());

    if (NativeClient) {
      NativeClient.start(this.config.toJSON());
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

  setUser = (id, name, email) => {
    NativeClient.setUser({id, name, email});
  }

  clearUser = () => {
    NativeClient.clearUser();
  }
}

export class Configuration {
  constructor(accessToken, options) {
    options = options || {};
    const pkgData = require('../package.json');
    this.version = pkgData['version'];
    this.accessToken = accessToken;
    this.logLevel = options.logLevel || 'debug';
    this.endpoint = options.endpoint || 'https://api.rollbar.com/api/1/';
    this.appVersion = options.appVersion || undefined;
    this.codeBundleId = options.codeBundleId || undefined;
    this.releaseStage = options.releaseStage || undefined;
    this.enabledReleaseStages = options.enabledReleaseStages || undefined;
    this.captureUncaught = options.captureUncaught !== undefined ? options.captureUncaught : true;
    this.captureUnhandledRejections = options.captureUnhandledRejections !== undefined ? options.captureUnhandledRejections : !__DEV__;
  }

  shouldSend = () => {
    return !this.releaseStage ||
      !this.enabledReleaseStages ||
      this.enabledReleaseStages.includes(this.releaseStage);
  }

  toJSON = () => {
    return {
      accessToken: this.accessToken,
      payload: {
        codeBundleId: this.codeBundleId,
        releaseStage: this.releaseStage,
        enabledReleaseStages: this.enabledReleaseStages,
        appVersion: this.appVersion
      },
      notifier: {
        name: 'rollbar-react-native',
        version: this.version
      }
    };
  }
}

export class Item {
  constructor(accessToken, obj, level, extra) {
    this.accessToken = accessToken;
    if (obj instanceof Error) {
      this.errorClass = obj.constructor.name;
      this.errorMessage = obj.message;
      this.stack = obj.stack;
    } else {
      this.message = obj;
    }
    this.level = level;
    this.metadata = extra || {};
    this.user = {};
  }

  addMetadata = (section, key, value) => {
    if (!this.metadata[section]) {
      this.metadata[section] = {};
    }
    this.metadata[section][key] = value;
  }

  toJSON = () => {
    return {
      accessToken: this.accessToken,
      errorClass: this.errorClass,
      errorMessage: this.errorMessage,
      stack: this.stack,
      message: this.message,
      level: this.level,
      metadata: typedMap(this.metadata),
      user: this.user
    }
  }
}

const allowedMapObjectTypes = ['string', 'number', 'boolean'];

const typedMap = function(map) {
  const output = {};
  for (const key in map) {
    if (!{}.hasOwnProperty.call(map, key)) {
      continue;
    }

    const value = map[key];

    if (value == undefined || (typeof value === 'number' && isNaN(value))) {
      output[key] = {type: 'string', value: String(value)}
    } else if (typeof value === 'object') {
      output[key] = {type: 'map', value: typedMap(value)};
    } else {
      const type = typeof value;
      if (allowedMapObjectTypes.includes(type)) {
        output[key] = {type: type, value: value};
      } else {
        console.warn(`Could not serialize metadata for '${key}': Invalid type '${type}'`);
      }
    }
  }
  return output;
}
