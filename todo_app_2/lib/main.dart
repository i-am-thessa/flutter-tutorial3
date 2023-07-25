import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_2/services/theme_service.dart';
import 'package:todo_app_2/ui/home_page.dart';
import 'package:todo_app_2/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const HomePage(),
    );
  }
}
