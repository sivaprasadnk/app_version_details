# App Version Details

A lightweight alternative for retrieving the app's version, build number and packagename on Android and iOS, replacing the package_info_plus plugin, which adds multiple dependencies under the hood and increases app size.

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  app_version_details: ^1.0.3
```

## Usage

First, import the package:

```dart
import 'package:app_version_details/app_version_details.dart';
```

Then, call `getAppVersion()` to fetch the app version:

```dart
void main() async {
  String? version = await AppVersionDetails().getAppVersion();
  print("$version");
}
```
### Example Output:
```
1.0.0+100
```
Where:
- `1.0.0` is the version name.
- `100` is the build number.

Call `getVersionName()` to fetch the app version name:

```dart
void main() async {
  String? versionName = await AppVersionDetails().getVersionName();
  print("$versionName");
}
```
### Example Output:
```
1.0.0
```

Call `getBuildNumber()` to fetch the app build number:

```dart
void main() async {
  String? buildNumber = await AppVersionDetails().getBuildNumber();
  print("$buildNumber");
}
```

### Example Output:
```
100
```

Call `getPackageName()` to fetch the package-name:

```dart
void main() async {
  String? name = await AppVersionDetails().getPackageName();
  print("$name");
}
```

### Example Output:
```
com.example.package
```

## Contributing

Pull requests are welcome! If you have any major changes in mind, please open an issue first to discuss them.


Made with ❤️ for Flutter developers!