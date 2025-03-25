# App Version Details

A simple, **lightweight**, and **dependency-free** Flutter plugin to retrieve the app's version name and build number on both Android and iOS.

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  app_version_details: ^0.0.3
```

## Usage

First, import the package:

```dart
import 'package:app_version_details/app_version_details.dart';
```

Then, call `getAppVersion()` to fetch the app version:

```dart
void main() async {
  String? version = await AppVersionInfo.getAppVersion();
  print("App Version: $version");
}
```
### Example Output:
```
1.0.0+100
```
Where:
- `1.0.0` is the version name.
- `100` is the build number.

Call `getAppVersionName()` to fetch the app version number:

```dart
void main() async {
  String? versionName = await AppVersionInfo.getAppVersionName();
  print("App Version Name: $versionName");
}
```
### Example Output:
```
1.0.0
```

Call `getAppBuildNumber()` to fetch the app build number:

```dart
void main() async {
  String? buildNumber = await AppVersionInfo.getAppBuildNumber();
  print("App Build Number: $buildNumber");
}
```

### Example Output:
```
100
```

## Contributing

Pull requests are welcome! If you have any major changes in mind, please open an issue first to discuss them.


Made with ❤️ for Flutter developers!