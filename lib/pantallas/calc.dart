import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});
  final String title;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  //          Mi propio código
  //            Declaración de variables a usar
  bool _punto = false;
  String _texto1= "0";
  String _texto2 = "0";
  String _lastChar = "";
  double? _valor1 = null;
  double? _valor2 = null;
  bool _nuevoNumero = false; // Nuevo flag para saber cuándo reiniciar _texto1

  void _presionaSimbolo(String a) {
    setState(() {
      if (a == "." && !_punto) {
        _punto = true;
        _texto1 += ".";
        return;
      }
      if(a == "+"){
        _valor1 = double.tryParse(_texto1);
        if(_valor2 == null){
          _valor2 = _valor1;
          _texto1 = "0";
          _texto2 = _valor2.toString();
        }else if(!_nuevoNumero){
          _valor1 = _valor1! + _valor2!;
          _texto2 = _valor1.toString();
          print("${_valor1} y ${_valor2}");
          _texto1 = _valor1.toString();
          _valor2 = _valor1;
          _nuevoNumero= true;
        }
        _lastChar ="+";
      }
      if(a == "-"){
        _valor1 = double.tryParse(_texto1);
        if(_valor2 == null){
          _valor2 = _valor1;
          _texto1 = "0";
          _texto2 = _valor2.toString();
        }else if(!_nuevoNumero){
          _valor1 = _valor2! - _valor1!;
          _texto2 = _valor1.toString();
          print("${_valor1} y ${_valor2}");
          _texto1 = _valor1.toString();
          _valor2 = _valor1;
          _nuevoNumero= true;
        }
        _lastChar ="-";
      }
      if(a == "x"){
        _valor1 = double.tryParse(_texto1);
        if(_valor2 == null){
          _valor2 = _valor1;
          _texto1 = "0";
          _texto2 = _valor2.toString();
        }else if(!_nuevoNumero){
          _valor1 = _valor1! * _valor2!;
          _texto2 = _valor1.toString();
          print("${_valor1} y ${_valor2}");
          _texto1 = _valor1.toString();
          _valor2 = _valor1;
          _nuevoNumero= true;
        }
        _lastChar ="x";
      }
      if(a == "/"){
        _valor1 = double.tryParse(_texto1);
        if(_valor2 == null){
          _valor2 = _valor1;
          _texto1 = "0";
          _texto2 = _valor2.toString();
        }else if(!_nuevoNumero){
          _valor1 = _valor2! / _valor1!;
          _texto2 = _valor1.toString();
          print("${_valor1} y ${_valor2}");
          _texto1 = _valor1.toString();
          _valor2 = _valor1;
          _nuevoNumero= true;
        }
        _lastChar ="/";
      }
      //      En caso de ya no estar apretando más botones
      if (a == "="){
        switch(_lastChar){
          case "":
            _texto1= _valor1.toString();
            break;
          case "+":
            _valor1 = double.tryParse(_texto1);
            print("Antes de sumar ${_valor1} y ${_valor2}");
            _valor1 = _valor1! + _valor2!;
            _texto2 = _valor1.toString();
            print("Cuando entra al igual ${_valor1} y ${_valor2}");
            _texto1 = _valor1.toString();
            _valor2 = _valor1;
            _nuevoNumero= true;
            break;
          case "-":
            _valor1 = double.tryParse(_texto1);
            _valor1 = _valor2! - _valor1!;
            _texto2 = _valor1.toString();
            _texto1 = _valor1.toString();
            _valor2 = _valor1;
            _nuevoNumero= true;
            break;
          case "x":
            _valor1 = double.tryParse(_texto1);
            _valor1 = _valor1! * _valor2!;
            _texto2 = _valor1.toString();
            _texto1 = _valor1.toString();
            _valor2 = _valor1;
            _nuevoNumero= true;
            break;
          case "/":
            _valor1 = double.tryParse(_texto1);
            _valor1 = _valor2! / _valor1!;
            _texto2 = _valor1.toString();
            _texto1 = _valor1.toString();
            _valor2 = _valor1;
            _nuevoNumero= true;
            break;
        }
      }
    });
  }

  void _presionaNumero(int n) {
    setState(() {
      if (_nuevoNumero) {
        _texto1 = n.toString();
        _nuevoNumero = false; // Se resetea para permitir concatenaciones normales
      } else {
        if (_texto1.length == 1 && _texto1 == "0") {
          _texto1 = n.toString();
        } else {
          _texto1 += n.toString();
        }
      }
    });
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
              width: 320,
              color: Colors.deepPurple,
              height: 20,
              child: Text("$_texto2",
              textAlign: TextAlign.right,
                style: TextStyle(fontSize: 10 ),
              ),
            ),

            Container(
              width: 320,
              color: Color.fromRGBO(128, 71, 243, 0.30196078431372547),
              height: 40,
              child: Text("$_texto1",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(

                  ),
                  onPressed:(){_presionaNumero(9);},
                  child: Text("9"),
                ),

                OutlinedButton(
                  style: ButtonStyle(

                  ),
                  onPressed:(){_presionaNumero(8);},
                  child: Text("8"),
                ),

                OutlinedButton(
                  style: ButtonStyle(

                  ),
                  onPressed:(){_presionaNumero(7);},
                  child: Text("7"),
                ),

                OutlinedButton(onPressed: (){_presionaSimbolo("+");}, child: Text("+"),)

              ]

            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(6);},
                    child: Text("6"),
                  ),

                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(5);},
                    child: Text("5"),
                  ),

                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(4);},
                    child: Text("4"),
                  ),

                  OutlinedButton(onPressed: (){_presionaSimbolo("-");}, child: Text("-"),)

                ]

            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(3);},
                    child: Text("3"),
                  ),

                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(2);},
                    child: Text("2"),
                  ),

                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(1);},
                    child: Text("1"),
                  ),

                  OutlinedButton(onPressed: (){_presionaSimbolo("x");}, child: Text("x"),)

                ]

            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaSimbolo(".");},
                    child: Text("."),
                  ),

                  OutlinedButton(
                    style: ButtonStyle(

                    ),
                    onPressed:(){_presionaNumero(0);},
                    child: Text("0"),
                  ),

                  OutlinedButton(
                    style: ButtonStyle(

                    ),

                    onPressed: (){_presionaSimbolo("=");}, child: Text("="),
                  ),

                  OutlinedButton(onPressed:(){_presionaSimbolo("/");}, child: Text("/"),)

                ]

            )
          ],

        ),
      ),
      floatingActionButton: Row(

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
