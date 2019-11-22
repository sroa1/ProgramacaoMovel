import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  TextEditingController pesoControle = TextEditingController();
  TextEditingController alturaControle = TextEditingController();
  String _info = "Informe seus dados";

  void _resetarTela() {
    pesoControle.text = "";
    alturaControle.text = "";
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoControle.text);
      double altura = double.parse(alturaControle.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.5) {
        _info = "Abaixo do peso: $imc";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular I.M.C."),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetarTela,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
              textAlign: TextAlign.center,
              controller: pesoControle,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25)),
              textAlign: TextAlign.center,
              controller: alturaControle,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
              child: RaisedButton(
                child: Text("Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                color: Colors.green,
                onPressed: _calcular,
              ),
            ),
            Text(
              _info,
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
