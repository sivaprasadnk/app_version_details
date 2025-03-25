
import 'app_version_details_platform_interface.dart';

class AppVersionDetails {
  Future<String?> getPlatformVersion() {
    return AppVersionDetailsPlatform.instance.getPlatformVersion();
  }
}
