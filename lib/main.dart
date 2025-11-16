import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Pawty(), // Wrap your app
    ),
  );
}

class Pawty extends StatelessWidget {
  const Pawty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pawty',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pawty'), centerTitle: false),
        body: const Center(child: Text('Welcome to Pawty!')),
      ),
    );
  }
}
