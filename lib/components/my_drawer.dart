import 'package:flutter/material.dart';
import 'package:router_mate/pages/about_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyDrawer extends StatelessWidget {
  final WebViewController controller;
  final VoidCallback clearCacheAndCookies; // Accept a function parameter

  const MyDrawer({
    super.key,
    required this.controller,
    required this.clearCacheAndCookies, // Update constructor
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header with logo
              DrawerHeader(
                child: Image.asset("assets/logo/router.png"),
              ),
              const SizedBox(height: 25.0),
              // Home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // Clear history tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text("Clear History"),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Do you want to clear all history?"),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text("No"),
                          ),
                          MaterialButton(
                            onPressed: () {
                              clearCacheAndCookies();
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  content: Text(
                                    "History cleared successfully!",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                              );
                            },
                            color: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text("Yes"),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Settings tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settingsPage');
                  },
                ),
              ),

              // About tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("About"),
                  onTap: () {
                    Navigator.pop(context);
                    aboutPage(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
