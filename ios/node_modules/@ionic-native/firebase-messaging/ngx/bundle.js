'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var tslib = require('tslib');
var core$1 = require('@angular/core');
var core = require('@ionic-native/core');
require('rxjs');

var FirebaseMessaging = /** @class */ (function (_super) {
    tslib.__extends(FirebaseMessaging, _super);
    function FirebaseMessaging() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    FirebaseMessaging.prototype.onMessage = function () { return core.cordova(this, "onMessage", { "observable": true, "callbackOrder": "reverse" }, arguments); };
    FirebaseMessaging.prototype.onBackgroundMessage = function () { return core.cordova(this, "onBackgroundMessage", { "observable": true, "callbackOrder": "reverse" }, arguments); };
    FirebaseMessaging.prototype.requestPermission = function (options) { return core.cordova(this, "requestPermission", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.getInstanceId = function () { return core.cordova(this, "getInstanceId", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.getToken = function (type) { return core.cordova(this, "getToken", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.onTokenRefresh = function () { return core.cordova(this, "onTokenRefresh", { "observable": true, "callbackOrder": "reverse" }, arguments); };
    FirebaseMessaging.prototype.subscribe = function (topic) { return core.cordova(this, "subscribe", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.unsubscribe = function (topic) { return core.cordova(this, "unsubscribe", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.getBadge = function () { return core.cordova(this, "getBadge", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.setBadge = function (value) { return core.cordova(this, "setBadge", { "sync": true }, arguments); };
    FirebaseMessaging.prototype.deleteToken = function () { return core.cordova(this, "deleteToken", { "sync": true }, arguments); };
    FirebaseMessaging.pluginName = "FirebaseMessaging";
    FirebaseMessaging.plugin = "cordova-plugin-firebase-messaging";
    FirebaseMessaging.pluginRef = "cordova.plugins.firebase.messaging";
    FirebaseMessaging.repo = "https://github.com/chemerisuk/cordova-plugin-firebase-messaging";
    FirebaseMessaging.platforms = ["Android", "iOS"];
    FirebaseMessaging.decorators = [
        { type: core$1.Injectable }
    ];
    return FirebaseMessaging;
}(core.IonicNativePlugin));

exports.FirebaseMessaging = FirebaseMessaging;
