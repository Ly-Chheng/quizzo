import 'dart:ui';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart';

class ShareController extends GetxController {
  Future<void> share(String text, String link) async {
    final content = '$text\n$link';

    if (kIsWeb) {
      Share.share(content);
    } else {
      await Share.share(content);
    }
  }

  // Method to share via specific apps (e.g., WhatsApp, Facebook)
  Future<void> shareViaWhatsApp(String text, String link) async {
    final content = '$text\n$link';
    await Share.share(content,
        subject: 'Share via WhatsApp',
        sharePositionOrigin: Rect.fromLTWH(0, 0, 100, 100));
  }

  Future<void> shareViaFacebook(String text, String link) async {
    final content = '$text\n$link';
    await Share.share(content, subject: 'Share via Facebook');
  }

  Future<void> shareViaEmail(String text, String link) async {
    final content = '$text\n$link';
    await Share.share(content, subject: 'Share via Email');
  }
}
