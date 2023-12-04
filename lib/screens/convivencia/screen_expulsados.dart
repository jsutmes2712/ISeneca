import 'package:flutter/material.dart';
import 'package:iseneca/providers/expulsados_provider.dart';
import 'package:iseneca/utils/human_formats.dart';
import 'package:iseneca/widgets/side_menu.dart';
import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';

class ScreenExpulsados extends StatelessWidget {
  const ScreenExpulsados({super.key});

  @override
  Widget build(BuildContext context) {
    final expulsadosProvider = Provider.of<ExpulsadosProvider>(context);
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Expulsados'),
              ),
              body: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => expulsadosProvider.selectDate(context),
                      child: Text(HumanFormats.formatDate(
                          expulsadosProvider.selectedDate.toLocal()))),
                  Expanded(
                    child: ListView.builder(
                        itemCount: expulsadosProvider.listaExpulsados.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              //_mostrarAlert(context, index, listadoExpulsadosHoy,
                              //    cogerDatosExpulsados);
                            },
                            child: ListTile(
                              title: Text(expulsadosProvider
                                  .listaExpulsados[index].apellidosNombre),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(expulsadosProvider
                                      .listaExpulsados[index].fecInic),
                                  const Text(" - "),
                                  Text(expulsadosProvider
                                      .listaExpulsados[index].fecFin),
                                ],
                              ),
                              subtitle: Text(expulsadosProvider
                                  .listaExpulsados[index].curso),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              drawer: const SideMenu(),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Expulsados'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
