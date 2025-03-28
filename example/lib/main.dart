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
  final _appVersionDetailsPlugin = AppVersionDetails();

  @override
  void initState() {
    super.initState();
    getVersion();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getVersion() async {
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      version =
          await _appVersionDetailsPlugin.getVersion() ??
          'Unknown app version';
    } on PlatformException {
      version = 'Failed to get app version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _appVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text('App Version : $_appVersion')),
      ),
    );
  }
}
