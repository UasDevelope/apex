import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let infoChannel = FlutterMethodChannel(name: "com.apex.app/info",
                                              binaryMessenger: controller.binaryMessenger)
    
    infoChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "getAppVersion" {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
          result(version)
        } else {
          result(FlutterError(code: "UNAVAILABLE",
                              message: "App version unavailable",
                              details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
