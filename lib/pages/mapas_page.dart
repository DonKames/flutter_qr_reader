import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scans_provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScansProvider>(
      context,
    );

    final scans = scanListProvider.scans;

    print(scans.length);

    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[index].valor),
        subtitle: Text('${scans[index].id}'),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () => print(scans[index].id),
      ),
    );
  }
}
