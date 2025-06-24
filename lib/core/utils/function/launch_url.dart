import 'package:bookly_app/core/utils/function/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null){
  Uri uri = Uri.parse(url);
  if (await canLaunch(uri as String)) {
    await launch(uri as String);
  } else {
    customSnackBar(context, 'Could not launch $url');
  }
}
}

