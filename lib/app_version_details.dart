import 'app_version_details_platform_interface.dart';

class AppVersionDetails {
  Future<String?> getVersion() {
    return AppVersionDetailsPlatform.instance.getVersion();
  }

  Future<String?> getPackageName() {
    return AppVersionDetailsPlatform.instance.getPackageName();
  }

  Future<String?> getVersionName() async {
    final version = await getVersion() ?? "1.0.0+100";
    return version.split('+').first; // "1.0.0"
  }

  Future<String?> getBuildNumber() async {
    final version = await getVersion() ?? "1.0.0+100";
    return version.split('+').last; // "100"
  }
}
