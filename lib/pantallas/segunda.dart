import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otra extends StatefulWidget {
  const Otra({super.key, required this.title});
  final String title;
  @override
  State<Otra> createState() => _OtraState();
}

class _OtraState extends State<Otra> {

  //                Parte de la persistencia de datos (Consumo)
  String _nombre = "";
  SharedPreferences? _prefs;
  void _cargaPreferencias() async{
    _prefs = await SharedPreferences.getInstance();
    _cargarNombre();
  }
  void _cargarNombre(){
    setState(() {
      _nombre =_prefs!.getString("Hola") ?? "Aun no metes nada";
    });
  }

  @override
  void initState() {
    super.initState();
    _cargaPreferencias();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hola usuario!!!"
            ),
            Text(
              _nombre,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, // Alinea los botones a la derecha
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
