import 'dart:js_interop';

import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});
  final String title;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double _total = 0 ;
  double _total2 = 0 ;
  int _contadorP = 10;
  bool _punto = false;
  void _presionaNumero(int n){
    setState(() {
      if(!_punto) _total = _total*10 + n;
      else {
        if(n == 0){
          _contadorP*=10;
        }else{
          _total = _total + (n/_contadorP);
          _contadorP*=10;
        }
      }
    });
  }
  void _presionaSimbolo(String a){
    if (a == "."){
      _punto = true;
    }
    if(a == '+'){
      _punto = false;
      _contadorP = 10;
      setState(() {
        _total2 += _total;
        _total=0;
      });
    }
    if(a == '='){
      setState(() {
        _total2 += _total;
        _total=0;
        _punto = false;
        _contadorP = 10;
      });
    }
    if(a == '/') {
    }
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
              child: Text("$_total2",
              textAlign: TextAlign.right,
                style: TextStyle(fontSize: 10 ),
              ),
            ),

            Container(
              width: 320,
              color: Color.fromRGBO(128, 71, 243, 0.30196078431372547),
              height: 40,
              child: Text("${_total}",
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
