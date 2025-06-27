import 'package:bookly_app/core/utils/function/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<void> launchCustomUrl(context, String? url) async {
//   if (url != null){
//   Uri uri = Uri.parse(url);
//   if (await canLaunch(uri)) {
//     await launch(uri);
//   } else {
//     customSnackBar(context, 'Could not launch $url');
//   }
// }
// }


Future<void> launchCustomUrl(BuildContext context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, 'Could not launch $url');
    }
  } else {
    customSnackBar(context, 'URL is not available.');
  }
}
