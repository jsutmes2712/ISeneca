import 'package:flutter/material.dart';

var cursos = {
  'eso':['1A','1B'],
  'bach':['1A','1B','1C'],
  'ciclos':['1DAM','2DAM']
};

enum Cursos {PrimeroA, PrimeroB, PrimeroC, SegundoA, SegundoB, SegundoC, TerceroA, TerceroB, TerceroC, CuartoA, CuartoB, CuartoC, PrimeroFPB, SegundoFPB}

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  int navNavigationDrawer = 0 ;
  Cursos seleccionCursos = Cursos.PrimeroA;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(      
      children: [

        ExpansionTile(
          title: const Text('CURSOS: '),
          subtitle: Text('Seleccionado: $seleccionCursos'),
          children: [
            RadioListTile(
              value: 'eso',
              groupValue: seleccionCursos, 
              onChanged: (value) => setState(() {
                seleccionCursos = Cursos.PrimeroA;
              }),
            ),
            RadioListTile(
              value: Cursos.PrimeroA,
              groupValue: seleccionCursos, 
              onChanged: (value) => setState(() {
                seleccionCursos = Cursos.PrimeroA;
              }),
            ),
            RadioListTile(
              value: Cursos.PrimeroA,
              groupValue: seleccionCursos, 
              onChanged: (value) => setState(() {
                seleccionCursos = Cursos.PrimeroA;
              }),
            )
          ]
        ),
        ExpansionTile(
          title: const Text('CURSOS: '),
          subtitle: Text('Seleccionado: $seleccionCursos'),
          children: [
              ...cursos['eso'].map((e) => RadioListTile(value: e, groupValue: groupValue, onChanged: ))
            ]  
        )
      ]
    );
  }
}