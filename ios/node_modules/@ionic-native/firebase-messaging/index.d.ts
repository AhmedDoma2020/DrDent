import { IonicNativePlugin } from '@ionic-native/core';
import { Observable } from 'rxjs';
export interface IFirebaseGCMMessage {
    gcm: {
        body: string;
        title: string;
        sound: string;
        icon: string;
        tag: string;
        color: string;
        clickAction: string;
    };
    'google.message_id': string;
    'google.sent_time': number;
    [key: string]: any;
}
export interface IFirebaseAPSMessage {
    aps: {
        alert: {
            title: string;
            body: string;
        };
        badge?: number;
    };
    'gcm.message_id': 'string';
    [key: string]: any;
}
export declare type IFirebaseMessage = IFirebaseAPSMessage | IFirebaseGCMMessage;
export interface IRequestPermissionOptions {
    forceShow?: boolean;
}
export declare type FirebaseMessagingTokenType = 'apns-buffer' | 'apns-string';
/**
 * @beta
 * @name Firebase Messaging
 * @description
 * Cordova plugin for Firebase Messaging
 *
 * @usage
 * ```typescript
 * import { FirebaseMessaging } from '@ionic-native/firebase-messaging/ngx';
 *
 *
 * constructor(private firebaseMessaging: FirebaseMessaging) { }
 *
 * ...
 *
 *
 * this.firebaseMessaging.logEvent('page_view', {page: "dashboard"})
 *   .then((res: any) => console.log(res))
 *   .catch((error: any) => console.error(error));
 *
 * ```
 * @interfaces
 * IFirebaseMessage
 */
export declare class FirebaseMessagingOriginal extends IonicNativePlugin {
    /**
     * Called when a push message received while app is in foreground.
     *
     * @returns {Observable<any>}
     */
    onMessage(): Observable<any>;
    /**
     * Called when a push message received while app is in background.
     *
     * @returns {Observable<any>}
     */
    onBackgroundMessage(): Observable<any>;
    /**
     * Grant permission to receive push notifications (will trigger prompt on iOS).
     *
     * @param {IRequestPermissionOptions} [options]
     * @returns {Promise<string>}
     */
    requestPermission(options?: {
        forceShow?: boolean;
    }): Promise<string>;
    /**
     * Returns a promise thaf fulfills with the device instance ID
     */
    getInstanceId(): Promise<string>;
    /**
     * Returns a promise that fulfills with the current FCM token
     *
     * This method also accepts optional argument type.
     * Currently iOS implementation supports values "apns-buffer" and "apns-string" that defines presentation of resolved APNS token.
     *
     * @param {FirebaseMessagingTokenType} [type] iOS only. Defines presentation of resolved APNS token
     * @returns {Promise<string>}
     */
    getToken(type?: FirebaseMessagingTokenType): Promise<string>;
    /**
     * Triggers every time when FCM token updated.
     * You should usually call getToken to get an updated token and send it to server.
     *
     * @returns {Observable<void>}
     */
    onTokenRefresh(): Observable<void>;
    /**
     * Subscribe to topic in background.
     *
     * @param {string} topic
     * @returns {Promise<null>}
     */
    subscribe(topic: string): Promise<null>;
    /**
     * Unsubscribe from topic in background.
     *
     * @param {string} topic
     * @returns {Promise<null>}
     */
    unsubscribe(topic: string): Promise<null>;
    /**
     * Reads current badge number (if supported).
     *
     * @returns {Promise<number>}
     */
    getBadge(): Promise<number>;
    /**
     * Sets current badge number (if supported).
     *
     * @param {number} value
     * @returns {Promise<null>}
     */
    setBadge(value: number): Promise<null>;
    /**
     * Revoke the current FCM token.
     *
     * @returns {Promise<null>}
     */
    deleteToken(): Promise<null>;
}

export declare const FirebaseMessaging: FirebaseMessagingOriginal;