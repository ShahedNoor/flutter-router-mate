import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_mate/pages/home_page.dart';
import 'package:router_mate/pages/settings_page.dart';

import 'theme/dark_mode.dart';
import 'theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Router Mate',
            theme: Provider.of<ThemeProvider>(context).themeData,
            darkTheme: darkMode,
            home: const HomePage(),
            routes: {
              '/settingsPage': (context) => const SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
