import 'package:flutter/material.dart';

//enum Cursos {PrimeroA,PrimeroB,PrimeroC,SegundoA,SegundoB,SegundoC,TerceroA,TerceroB,TerceroC,CuartoA,CuartoB,CuartoC,PrimeroFPB,SegundoFPB}

Map<String, List<String>> cursos = {
  'ESO': ['1A', '1B', '1C', '2A', '2B', '2C'],
  'BACH': ['1A', '1B', '1C', '1D', '2A', '2B'],
  'CICLOS': ['1FPB', '2FPB', '1DAM', '2DAM']
};

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String seleccionCursos = 'ESO'; 
  String seleccionAula = cursos['ESO']![0]; 
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        ExpansionTile(
          title: const Text('CURSOS: '),
          subtitle: Text('Seleccionado: $seleccionCursos'),
          children: [
            RadioListTile(
              title: const Text('ESO'),
              value: 'ESO',
              groupValue: seleccionCursos,
              onChanged: (value) {
                setState(() {
                  seleccionCursos = 'ESO';
                });
              },
            ),
            RadioListTile(
              title: const Text('Bachillerato'),
              value: 'BACH',
              groupValue: seleccionCursos,
              onChanged: (value) {
                setState(() {
                  seleccionCursos = 'BACH';
                });
              },
            ),
            RadioListTile(
              title: const Text('Ciclos Formativos'),
              value: 'CICLOS',
              groupValue: seleccionCursos,
              onChanged: (value) {
                setState(() {
                  seleccionCursos = value!;
                  seleccionAula = cursos[seleccionCursos]![0]; 
                });
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('CURSOS: '),
          subtitle: Text('Seleccionado: $seleccionAula'),
          children: [
            ...cursos[seleccionCursos]!.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: seleccionAula,
              onChanged: (value) {
                setState(() {
                  seleccionAula = value!;
                });
              },
            )),
          ],
        ),
      ],
    );
  }
}
