import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scans_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3d8BEF', 'Cancelar', false, ScanMode.QR);

        //const barcodeScanRes = 'http://google.cl/';
        //const barcodeScanRes = 'geo:-33.378725,-70.688040';

        if (barcodeScanRes == '-1') return;

        final scansProvider =
            Provider.of<ScansProvider>(context, listen: false);

        final nuevoScan = await scansProvider.nuevoScan(barcodeScanRes);

        launcherUrl(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
