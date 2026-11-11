import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlsService {
  Future<bool> launchWhatsApp({
    required String phone,
    String? countryCode,
    String? message,
  }) async {
    String sanitizedPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');
    if (countryCode != null && !sanitizedPhone.startsWith('+')) {
      sanitizedPhone = '$countryCode$sanitizedPhone';
    }
    sanitizedPhone = sanitizedPhone.replaceAll('+', '');

    final encodedMessage = message != null ? '?text=${Uri.encodeComponent(message)}' : '';
    final Uri uri = Uri.parse('https://wa.me/$sanitizedPhone$encodedMessage');
    return _launch(uri, mode: LaunchMode.externalApplication);
  }

  Future<bool> launchCall({required String phone}) async {
    final Uri uri = Uri.parse('tel:$phone');
    return _launch(uri);
  }

  Future<bool> launchEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    return _launch(uri);
  }

  Future<bool> launchBrowser({
    required String url,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      log('Invalid URL: $url');
      return false;
    }
    return _launch(uri, mode: mode);
  }

  Future<bool> openMap(double latitude, double longitude) async {
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    final Uri appleMapsUrl = Uri.parse(
      'https://maps.apple.com/?q=$latitude,$longitude',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      return await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(appleMapsUrl)) {
      return await launchUrl(appleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      log('Could not launch maps application');
      return false;
    }
  }

  Future<bool> _launch(Uri uri, {LaunchMode mode = LaunchMode.platformDefault}) async {
    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: mode);
      } else {
        log('Could not launch $uri');
        return false;
      }
    } catch (e) {
      log('Error launching $uri: $e');
      return false;
    }
  }
}
