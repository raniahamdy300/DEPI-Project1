import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import './ui/theme.dart';
import './services/theme_services.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyDo App',
      theme: ThemeData(primarySwatch: Colors.purple),
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: HomePage(),
    );
  }
}
