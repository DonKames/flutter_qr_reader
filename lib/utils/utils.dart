import 'package:flutter/material.dart';
import 'package:qr_reader/model/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launcherUrl(BuildContext context, ScanModel scan) async {
  final url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    //Abrir el sitio Web
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
