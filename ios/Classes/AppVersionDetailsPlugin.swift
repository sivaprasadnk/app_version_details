import Flutter
import UIKit

public class AppVersionDetailsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_version_details", binaryMessenger: registrar.messenger())
    let instance = AppVersionDetailsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAppVersion":
        if let infoDictionary = Bundle.main.infoDictionary,
           let versionName = infoDictionary["CFBundleShortVersionString"] as? String,
           let versionCode = infoDictionary["CFBundleVersion"] as? String {
            let versionInfo = "\(versionName)+\(versionCode)"
            result(versionInfo)
        } else {
            result(FlutterError(code: "ERROR", message: "Failed to get version info", details: nil))
        }
    case "getPackageName":
        let packageName = Bundle.main.bundleIdentifier ?? "Unknown"
        result(packageName)
    default:
        result(FlutterMethodNotImplemented)
    }
  }
}
