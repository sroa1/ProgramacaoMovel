import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)))),
  ));
}

Future<Map> getDados() async {
  String url = "https://api.hgbrasil.com/finance?format=json-cors&key=e5995e0d";
  var response = await http.get(url);
  return json.decode(response.body);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" \$ Conversor \$"),
      ),
      backgroundColor: Colors.amber,
      body: FutureBuilder(
        future: getDados(),
        builder: (context, conexao) {
          switch (conexao.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                ),
              );
            default:
              if (conexao.hasError) {
                return Center(
                  child: Text(
                    "Deu erro...",
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        color: Colors.amber,
                        size: 150,
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Real",
                            labelStyle: TextStyle(color: Colors.amber),
                            border: OutlineInputBorder(),
                            prefix: Text(
                              "R\$",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 25),
                            )),
                        style: TextStyle(color: Colors.amber, fontSize: 25),
                        keyboardType: TextInputType.number,
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Dolar",
                            labelStyle: TextStyle(color: Colors.amber),
                            border: OutlineInputBorder(),
                            prefix: Text(
                              "U\$",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 25),
                            )),
                        style: TextStyle(color: Colors.amber, fontSize: 25),
                        keyboardType: TextInputType.number,
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Euros",
                            labelStyle: TextStyle(color: Colors.amber),
                            border: OutlineInputBorder(),
                            prefix: Text(
                              "\£",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 25),
                            )),
                        style: TextStyle(color: Colors.amber, fontSize: 25),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
