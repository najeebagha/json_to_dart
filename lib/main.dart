import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_to_agha/src/screens/home_screen.dart';

import 'src/utils/config/theme_light.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid || kIsWeb) {
    runApp(const MyApp());
  } else if (Platform.isWindows) {
    runApp(const MyApp());
    doWhenWindowReady(() {
      const initialSize = Size(360, 695);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.topRight;
      appWindow.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Mytheme.lighTeme(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      title: 'Agha Apps',
      home: HomeScreen(),
    );
  }
}
