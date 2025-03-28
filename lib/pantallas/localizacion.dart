import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Localizacion extends StatefulWidget {
  const Localizacion({super.key, required this.title});
  final String title;
  @override
  State<Localizacion> createState() => _LocalizacionState();
}

class _LocalizacionState extends State<Localizacion> {
  String lat = "";
  String long = "";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // Comprobar si los permisos no estan activados
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  void  _obtenerCoors() async{
    Position pos = await _determinePosition();
    setState(() {
      lat = pos.latitude.toString();
      long = pos.longitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hola aqui consulta tu localizacion!!", style: TextStyle(color: Colors.deepPurple, fontSize: 30)),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(onPressed: (){_obtenerCoors();}, color: Colors.cyanAccent, ),
              SizedBox(
                height: 30,
              ),
            ]
          ),
          SizedBox(
            height: 40,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Tu longitud es: $long"),

              ]
          ),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Tu latitud es: $lat"),
              ]
          )
        ],
      ),
      floatingActionButton: Row(

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
