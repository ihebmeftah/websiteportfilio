import 'package:url_launcher/url_launcher.dart';

Future<void> openExternal(String url) {
  return launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
}
