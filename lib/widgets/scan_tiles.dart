import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/scans_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scansProvider = Provider.of<ScansProvider>(
      context,
    );

    final scans = scansProvider.scans;

    return ListView.builder(
      itemCount: scansProvider.scans.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          scansProvider.deleteScansById(scans[index].id!);
        },
        key: UniqueKey(),
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.gps_fixed_rounded : Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].valor),
          subtitle: Text('${scans[index].id}'),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => launcherUrl(context, scans[index]),
        ),
      ),
    );
  }
}
