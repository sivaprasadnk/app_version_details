import 'dart:async';

import 'package:app_version_details/app_version_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _appVersion = 'Unknown';
  String _packageName = 'Unknown';

  @override
  void initState() {
    super.initState();
    getVersion();
    getPackageName();
  }

  Future<void> getVersion() async {
    String version;
    try {
      version = await AppVersionDetails().getVersion() ?? 'Unknown app version';
    } on PlatformException {
      version = 'Failed to get app version.';
    }

    if (!mounted) return;

    setState(() {
      _appVersion = version;
    });
  }

  Future<void> getPackageName() async {
    String name;
    try {
      name =
          await AppVersionDetails().getPackageName() ?? 'Unknown package name';
    } on PlatformException {
      name = 'Failed to get package name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _packageName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("App Version :$_appVersion"),
            Text("Package Name :$_packageName"),
          ],
        ),
      ),
    );
  }
}
