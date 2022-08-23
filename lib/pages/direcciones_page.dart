import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scans_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listScans = Provider.of<ScansProvider>(context);
    final scans = listScans.scans;

    return Center(
      child: ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, int index) => ListTile(
          leading: Icon(
            Icons.gps_fixed_rounded,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.grey,
          ),
          onTap: () => print(scans[index].id),
        ),
      ),
    );
  }
}
