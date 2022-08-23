import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/model/scan_model.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scans_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/widgets/custom_navigationbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      bottomNavigationBar: const CustomNavigationbar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt.
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar la pagina respectiva.
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: Temporal - Leer la base de datos.
    final tempScan = ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.deleteAllScans();
    //DBProvider.db.getAllScans().then(print);

    //Usar el ScanListProvider
    final scanListProvider = Provider.of<ScansProvider>(
      context,
      listen: false,
    );

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapasPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
