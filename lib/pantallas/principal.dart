import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FirebaseFirestore db =
      FirebaseFirestore.instance; //Instancia de la base de datos
  void _leerDesdeLaBase() async {
    DocumentSnapshot<Map<String, dynamic>> objeto =
        await db.collection('sumador').doc('documento').get();
    setState(() {
      _counter = objeto.get('contador');
    });
  }

  void _escribirDatos() async {
    Map<String, int> objetoBD = {"contador": _counter};
    await db.collection('sumador').doc('documento').set(objetoBD);
  }

  void _incrementCounter() {
    setState(() {
      _counter += 10;
    });
    _escribirDatos();
  }

  void _decrementCounter() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _counter -= 10;
      });
      _escribirDatos();
    });
  }

  @override
  void initState() {
    super.initState();
    _leerDesdeLaBase();
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
            const Text(
              'Da click en el boton',
            ),
            SizedBox(
              height: _counter.toDouble(),
              child: Image.network(
                  "https://uploads-ssl.webflow.com/6377bf360873283fad488724/638ca82a95fb434e6f42a283_Flutter.png"),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, // Alinea los botones a la derecha
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10), // Espacio entre botones
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
