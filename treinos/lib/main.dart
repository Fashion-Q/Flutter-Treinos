import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:treinos/appbrazfailure/feature/recarga/module_recarga.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Carbona'
      ),
      home: const ModuleRecarga(),
    );
  }
}