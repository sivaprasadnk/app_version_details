import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_version_details_platform_interface.dart';

/// An implementation of [AppVersionDetailsPlatform] that uses method channels.
class MethodChannelAppVersionDetails extends AppVersionDetailsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_version_details');

  @override
  Future<String?> getVersion() async {
    final version = await methodChannel.invokeMethod<String>('getAppVersion');
    return version;
  }
}
