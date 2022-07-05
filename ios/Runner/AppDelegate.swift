import UIKit
import Flutter
import GoogleMaps
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
        FirebaseApp.configure()

   GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyACRf9vyKHRNQ_U9C6YwJm22d_YtYxA8Uc")

  if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
  }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    

}
