import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:router_mate/components/my_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _gateway;
  bool isLoading = true;
  bool isDesktopMode = false; // Track desktop or mobile mode
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (error) {
            print('Web resource error: $error');
          },
        ),
      );

    _getGateway();
  }

  Future<void> _getGateway() async {
    final info = NetworkInfo();
    final wifiInfo = await info.getWifiIP();

    if (wifiInfo != null) {
      final parts = wifiInfo.split('.');
      if (parts.length == 4) {
        setState(() {
          _gateway = '${parts[0]}.${parts[1]}.${parts[2]}.1';
          print('Loading router address: $_gateway');
          _controller.loadRequest(Uri.parse('http://$_gateway'));
        });
      }
    } else {
      setState(() {
        _gateway = null;
        print('Could not retrieve router address.');
      });
    }
  }

  void _toggleMode() {
    setState(() {
      isDesktopMode = !isDesktopMode;

      final userAgent = isDesktopMode
          ? "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
          : "Mozilla/5.0 (iPhone; CPU iPhone OS 13_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Mobile/15E148 Safari/604.1";

      _controller.loadRequest(Uri.parse("about:blank")).then((_) {
        _controller.setUserAgent(userAgent);
        _controller.loadRequest(Uri.parse('http://$_gateway'));
      });
    });
  }

  // Method to clear cache and cookies
  void _clearCacheAndCookies() async {
    // Clear the WebView cache
    await _controller.clearCache();

    // Clear the cookies
    final cookieManager = WebViewCookieManager();
    await cookieManager.clearCookies();

    print("Cache and cookies cleared.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Router Mate'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          // Realod button
          IconButton(
            onPressed: () {
              _controller.reload();
            },
            icon: const Icon(Icons.replay_outlined),
          ),

          // Desktop mode button
          IconButton(
            onPressed: _toggleMode,
            icon:
                Icon(isDesktopMode ? Icons.desktop_windows : Icons.smartphone),
          ),
        ],
      ),
      drawer: MyDrawer(
        controller: _controller,
        clearCacheAndCookies: _clearCacheAndCookies, // Pass the function here
      ),
      body: _gateway == null
          ? const Center(
              child: Text('Getting gateway...'),
            )
          : Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
    );
  }
}
