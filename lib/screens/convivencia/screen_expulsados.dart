import 'package:flutter/material.dart';
import 'package:iseneca/providers/expulsados_provider.dart';
import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';

class ScreenExpulsados extends StatefulWidget {
  const ScreenExpulsados({super.key});

  @override
  State<ScreenExpulsados> createState() => _ScreenExpulsadosState();
}

class _ScreenExpulsadosState extends State<ScreenExpulsados> {

  @override
  Widget build(BuildContext context) {
    final expulsadosProvider = Provider.of<ExpulsadosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expulsados'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: ()  => expulsadosProvider.selectDate(context),
            child: const Text('fecha')
          ),
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
                    title: Text(expulsadosProvider.listaExpulsados[index].apellidosNombre),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(expulsadosProvider.listaExpulsados[index].fecInic),
                        const Text(" - "),
                        Text(expulsadosProvider.listaExpulsados[index].fecFin),
                      ],
                    ),
                    subtitle: Text(expulsadosProvider.listaExpulsados[index].curso),
                  ),
                );
              }
            ),
          ),
          
        ],
      ),
    );
  }
}
