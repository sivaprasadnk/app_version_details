import 'package:app_version_details/app_version_details.dart';
import 'package:app_version_details/app_version_details_method_channel.dart';
import 'package:app_version_details/app_version_details_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppVersionDetailsPlatform
    with MockPlatformInterfaceMixin
    implements AppVersionDetailsPlatform {
  @override
  Future<String?> getAppVersion() => Future.value('1.0.0+1');
}

void main() {
  final AppVersionDetailsPlatform initialPlatform =
      AppVersionDetailsPlatform.instance;

  test('$MethodChannelAppVersionDetails is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppVersionDetails>());
  });

  test('getPlatformVersion', () async {
    AppVersionDetails appVersionDetailsPlugin = AppVersionDetails();
    MockAppVersionDetailsPlatform fakePlatform =
        MockAppVersionDetailsPlatform();
    AppVersionDetailsPlatform.instance = fakePlatform;

    expect(await appVersionDetailsPlugin.getAppVersion(), '1.0.0+1');
  });
}
