import 'package:flutter/material.dart';
import 'package:prueba_udea/triangulos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tipos Triangulos.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resultado = "No calculado aun";
  String imagen = "assets/images/question.png";
  var num1 = TextEditingController();
  var num2 = TextEditingController();
  var num3 = TextEditingController();

  void proceso() {
    setState(() {
      if (num1.text.isEmpty || num2.text.isEmpty || num3.text.isEmpty) {
        resultado = "Ingrese valores";
      } else {
        Triangulo t = Triangulo(
          int.parse(num1.text),
          int.parse(num2.text),
          int.parse(num3.text),
        );
        t.tipoTriangulo();
        resultado = t.tipo;
        imagen = t.img;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Triangulo.',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: num1,
                  decoration: const InputDecoration(
                      labelText: "Lado A",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.square_foot_rounded,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: num2,
                  decoration: const InputDecoration(
                      labelText: "Lado B",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.square_foot_rounded,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: num3,
                  decoration: const InputDecoration(
                      labelText: "Lado C",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.square_foot_rounded,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton.icon(
                  onPressed: proceso,
                  icon: const Icon(Icons.send),
                  label: const Text("Calcular"),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Triangulo: $resultado",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 23, 27, 150),
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black12, width: 4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    imagen,
                    width: 200,
                    height: 200,
                  ),
                  // Image.network(
                  //   "https://talently.tech/blog/wp-content/uploads/2021/11/Prueba-Tecnica.png",
                  //   width: 200,
                  //   height: 200,
                  // ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
