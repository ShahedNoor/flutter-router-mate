import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_mate/theme/theme_provider.dart';

import '../theme/light_mode.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
            ),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              title: const Text("Dark Mode"),
              trailing: CupertinoSwitch(
                value:
                    Provider.of<ThemeProvider>(context).themeData == lightMode
                        ? false
                        : true,
                onChanged: (_) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
