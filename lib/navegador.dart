import 'package:flutter/material.dart';
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
    if(v == 1){
      _p++;
      // En caso de exceder
      if(_p > _pantallas.length-1) _p = _pantallas.length-1;
    } else if(v == 0){
      _p--;
      // en caso de retroceder de más
      if(_p < 0) _p = 0;
    }
    setState(() {
      _cuerpo = _pantallas[_p];
    });
  }
  @override
  void initState(){
    super.initState();
    _pantallas.add(const MyHomePage(title: "Hola a todos!!!!"));
    _pantallas.add(const Otra(title: "Adios a todos!!!!"));
    _pantallas.add(const Calculadora(title: "Calcula"));
    _cuerpo = _pantallas[_p];
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _cuerpo,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _cambiaPantalla(value),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(label:"Atras",icon: Icon(Icons.arrow_back,)),
            BottomNavigationBarItem(label:"Adelante",icon: Icon(Icons.arrow_forward,)),
      ]),
    );
  }
}