import 'package:flutter/material.dart';
import 'package:iseneca/models/models.dart';
import 'package:iseneca/utils/human_formats.dart';
import 'package:iseneca/utils/peticion_expulsados.dart';

class ExpulsadosProvider extends ChangeNotifier {
  //Script Google
  //https://script.google.com/macros/s/AKfycbyPsB_koj3MwkmRFn8IJU-k4sOP8nRfnHHKNNt9xov9INZ1VEsQbu96gDR8Seiz0oDGOQ/exec?spreadsheetId=1ZcdgFdnsp69tXP-S2VVwRM2z3Ucmv2EPrOkH9QIp4nA&sheet=Expulsados
  //Google Docs Convivencia

  List<Expulsado> listaExpulsados = [];

  DateTime selectedDate = DateTime.now();

  ExpulsadosProvider() {
    debugPrint('Convivencia Provider inicializada');
    notifyListeners();
  }

  Future<void> getExpulsados() async {
  final List<Expulsado> expulsadoResponse = await PeticionExpulsados().getExpulsados();

  // Filtrar la lista de expulsados por la fecha dada
  List<Expulsado> expulsadosFiltrados = expulsadoResponse.where((expulsado) {
    // Convierte la fecha del objeto Expulsado a solo la fecha sin la hora
    DateTime fechaExpulsado = HumanFormats.formatStringToDate(expulsado.fecInic);

    // Compara si la fecha del expulsado es igual a la fecha seleccionada
    return fechaExpulsado.isAtSameMomentAs(selectedDate);
  }).toList();

  // Actualiza la lista de expulsados con la lista filtrada
  listaExpulsados = expulsadosFiltrados;

  notifyListeners();
}

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
    }
    notifyListeners();
  }

}
