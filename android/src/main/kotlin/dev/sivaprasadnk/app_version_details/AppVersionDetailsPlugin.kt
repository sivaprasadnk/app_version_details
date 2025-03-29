package dev.sivaprasadnk.app_version_details

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AppVersionDetailsPlugin */
class AppVersionDetailsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will handle communication between Flutter and native Android
  private lateinit var channel: MethodChannel
  private lateinit var packageManager: PackageManager
  private lateinit var packageName: String

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_version_details")
    channel.setMethodCallHandler(this)

    // Initialize packageManager and packageName
    val context = flutterPluginBinding.applicationContext
    packageManager = context.packageManager
    packageName = context.packageName
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getAppVersion") {
      try {
        val packageInfo: PackageInfo = packageManager.getPackageInfo(packageName, 0)
        val versionName = packageInfo.versionName
        val versionCode = packageInfo.longVersionCode
        val versionInfo = "$versionName+$versionCode"
        result.success(versionInfo)
      } catch (e: PackageManager.NameNotFoundException) {
        result.error("ERROR", "Failed to get version info", null)
      }
    } else if(call.method =="getPackageName") {
      result.success(packageName);
    }else{
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
