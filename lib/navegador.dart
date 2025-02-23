import 'package:flutter/material.dart';
import 'package:pagina_muestra/pantallas/bienv.dart';
import 'package:pagina_muestra/pantallas/principal.dart';
import 'pantallas/segunda.dart';
import 'pantallas/calc.dart';
class Navegador extends StatefulWidget{
  const Navegador({super.key});
  @override
  State<Navegador> createState() => _NavegadorState();

}
class _NavegadorState extends State<Navegador>{
  // Widget _cuerpo = Otra(title: "Hola a todos!!!!");
   Widget? _cuerpo;
  List<Widget> _pantallas = [];
  int _p=0;

  void _cambiaPantalla(int v){
    setState(() {
      _p = v;
      _cuerpo = _pantallas[_p];
    });
  }


  @override
  void initState(){
    super.initState();
    _pantallas.add(const Bienvenido(title: "Persistencia de datos"));
    _pantallas.add(const Calculadora(title: "Calcula"));
    _pantallas.add(const Otra(title: "Adios a todos!!!!"));
    _pantallas.add(const MyHomePage(title: "Hola a todos!!!!"));
    _cuerpo = _pantallas[_p];
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _cuerpo,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Detalle visual para observar más un icono seleccionado
        currentIndex: _p,
        onTap: (value) => _cambiaPantalla(value),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(label:"Bienvenido",icon: Icon(Icons.home,)),
            BottomNavigationBarItem(label:"calculadora",icon: Icon(Icons.calculate_outlined,)),
            BottomNavigationBarItem(label:"saludo",icon: Icon(Icons.handshake_outlined,)),
            BottomNavigationBarItem(label:"principal",icon: Icon(Icons.accessibility_sharp,)),
      ]),
    );
  }
}