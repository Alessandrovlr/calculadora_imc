import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  double result = 0.0;
  String infoTexto = "insira seus dados!!";

  void resetInf() {
    setState(() {
      peso.text = "";
      altura.text = "";
      infoTexto = "insira seus dados!!";
    });
  }

  void calcularMc() {
    int pesoCal = 0, alturaCal = 0;
    setState(() {
      pesoCal = int.tryParse(peso.text)!;
      alturaCal = int.tryParse(altura.text)!;
      result = pesoCal / ((alturaCal / 100) * (alturaCal / 100));

      if (result < 16.9) {
        infoTexto = "Muito abaixo do peso!";
      } else if (result <= 18.4) {
        infoTexto = "Abaixo do peso!";
      } else if (result <= 24.9) {
        infoTexto = "Peso normal!";
      } else if (result <= 29.9) {
        infoTexto = "Acima do peso!";
      } else {
        infoTexto = "passo menzinho!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text(
                "calculadora IMC",
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  onPressed: resetInf,
                  icon: Icon(Icons.refresh, color: Colors.white)),
            ]),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_outlined, size: 70, color: Colors.green),
              TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.green, fontSize: 23)),
                  controller: peso,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: InputDecoration(
                      labelText: "Altura(cm)",
                      labelStyle: TextStyle(color: Colors.green, fontSize: 23)),
                  controller: altura,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              TextButton(
                  onPressed: calcularMc,
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Calcular",
                      style: TextStyle(fontSize: 20, color: Colors.white))),
              SizedBox(
                height: 20,
              ),
              Text(
                '${infoTexto}',
                style: (result >= 30)
                    ? TextStyle(fontSize: 20, color: Colors.red)
                    : TextStyle(fontSize: 20, color: Colors.green),
              )
            ],
          ),
        ));
  }
}
