import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_version_details_method_channel.dart';

abstract class AppVersionDetailsPlatform extends PlatformInterface {
  /// Constructs a AppVersionDetailsPlatform.
  AppVersionDetailsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppVersionDetailsPlatform _instance = MethodChannelAppVersionDetails();

  /// The default instance of [AppVersionDetailsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppVersionDetails].
  static AppVersionDetailsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppVersionDetailsPlatform] when
  /// they register themselves.
  static set instance(AppVersionDetailsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getVersion() {
    throw UnimplementedError('appVersion() has not been implemented.');
  }

  Future<String?> getPackageName() {
    throw UnimplementedError('getPackageName() has not been implemented.');
  }

}
