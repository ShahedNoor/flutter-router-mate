// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void aboutPage(BuildContext context) {
//   showAboutDialog(
//     context: context,
//     applicationIcon: Image.asset(
//       "assets/logo/router.png",
//       height: 35,
//       width: 35,
//     ),
//     applicationName: 'Router Mate',
//     applicationVersion: '1.0.0',
//     applicationLegalese: 'Developed by: Shahed Noor',
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: Text(
//           'Router Mate is a comprehensive tool designed to enhance your networking experience. Find me on the button below!',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Theme.of(context).colorScheme.inversePrimary,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 20),
//         child: TextButton(
//           onPressed: () => _launchURL('https://beacons.ai/developernoor'),
//           style: TextButton.styleFrom(
//             backgroundColor: Theme.of(context).colorScheme.primary,
//             foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//           ),
//           child: const Text(
//             'Find Me',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// void _launchURL(String urlString) async {
//   final Uri url = Uri.parse(urlString);
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $urlString';
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void aboutPage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Image.asset(
              "assets/logo/router.png",
              height: 35,
              width: 35,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Router Mate'),
                  Text(
                    "Version: 1.0.0",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Developer: Shahed Noor",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Router Mate is a comprehensive tool designed to enhance your networking experience. Find me on the button below!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () =>
                      _launchURL('https://beacons.ai/developernoor'),
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Find Me',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              showLicensePage(context: context);
            },
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text("View Licesces"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}

void _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $urlString';
  }
}
