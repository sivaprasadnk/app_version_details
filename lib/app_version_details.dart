import 'app_version_details_platform_interface.dart';

class AppVersionDetails {
  Future<String?> getAppVersion() {
    return AppVersionDetailsPlatform.instance.getAppVersion();
  }

  Future<String?> getAppVersionName() async {
    final version = await getAppVersion() ?? "1.0.0+100";
    return version.split('+').first; // "1.0.0"
  }

  Future<String?> getAppBuildNumber() async {
    final version = await getAppVersion() ?? "1.0.0+100";
    return version.split('+').last; // "100"
  }
}
