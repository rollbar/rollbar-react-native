import { Platform, NativeModules } from 'react-native';
import Rollbar from './Rollbar';
import { merge } from './merge';

const NativeClient = NativeModules.RollbarReactNative;

export class Client {
  constructor(config) {
    this.isNative = Platform.OS !== 'web';

    if (this.isNative) {
      this.config = new Configuration(config);
      this.config.setPlatform(Platform.OS);

      if (NativeClient) {
        NativeClient.init(this.config.toJSON());
      }

      this.rollbar = new Rollbar(this.config.toJSON());

      this.captureUncaughtExceptions();
      if (this.config.captureUnhandledRejections) {
        this.captureUnhandledRejections();
      }
    } else {
      this.rollbar = new Rollbar(config);
    }
  }

  captureUncaughtExceptions = () => {
    if (this.isNative && typeof ErrorUtils !== undefined) {
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
    if (this.isNative && !this.config.shouldSend()) {
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
    this.rollbar.configure({}, {person: {id, name, email}});
    if (NativeClient) {
      NativeClient.setPerson({id, name, email});
    }
  }

  clearPerson = () => {
    this.rollbar.configure({}, {person: {}});
    if (NativeClient) {
      NativeClient.clearPerson();
    }
  }
}

class Configuration {
  constructor(options) {
    const pkgData = require('../package.json');

    // Ensure captureDeviceInfo is set before calling payloadOptions() below.
    this.captureDeviceInfo = options.captureDeviceInfo === undefined ? false : options.captureDeviceInfo;

    this.options = merge(options || {}, {
      payload: merge(options.payload, this.payloadOptions()),
      notifier: {
        name: 'rollbar-react-native',
        version: pkgData['version']
      }
    });
  }

  shouldSend = () => {
    return !this.releaseStage ||
      !this.enabledReleaseStages ||
      this.enabledReleaseStages.includes(this.releaseStage);
  }

  setPlatform = (platform) => {
    if (this.platform === undefined) {
      this.platform = platform;
    }
  }

  payloadOptions = () => {
    if (!this.captureDeviceInfo) {
      return {};
    }

    return {
      client: {
        os: this.deviceAttributes()
      }
    }
  }

  deviceAttributes = () => {
    if (NativeClient) {
      return JSON.parse(NativeClient.deviceAttributes());
    } else {
      return {};
    }
  }

  toJSON = () => {
    return merge(this.options, {
      platform: this.platform
    });
  }
}
