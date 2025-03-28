import 'package:shared_preferences/shared_preferences.dart';
// PUB.dev Todas las librerias de dart
// Para persistencias https://pub.dev/packages/shared_preferences
import 'package:flutter/material.dart';

class Bienvenido extends StatefulWidget {
  const Bienvenido(
      {super.key, required this.title, required this.funcionCambiaPantallas});
  final String title;
  final Function funcionCambiaPantallas;
  @override
  State<Bienvenido> createState() => _BienvenidoState();
}

class _BienvenidoState extends State<Bienvenido> {
  final TextEditingController _cachar = TextEditingController();

  // Shared preferences para estados globales
  void _guardarNombre(String n) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Hola", n);
    widget.funcionCambiaPantallas();
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
            Container(
              width: 500,
              color: Colors.amberAccent,
              height: 100,
              child: Text(
                "Ingresa tu nombre",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              child: TextField(
                // Propiedad para cachar
                controller: _cachar,
                style: TextStyle(fontSize: 30, height: 2),
              ),
            ),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    _guardarNombre(_cachar.text);
                    print(_cachar.text);
                    _cachar.text = "";
                  },
                  child: Text("Aceptar"),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Row(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
