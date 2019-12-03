import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define un widget de formulario personalizado
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define la clase State correspondiente. Esta clase contendrá los datos relacionados con
// nuestro formulario.
class _MyCustomFormState extends State<MyCustomForm> {
  // Crea un controlador de texto. Lo usaremos para recuperar el valor actual
  // del TextField!
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  bool varon = false;
  bool mujer = false;
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myController.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: <Widget>[
            TextField(
              controller: myController,
              onChanged: (text) {
                print("First text field: $text");
              },
            ),
            TextField(
              controller: myController2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("varon"),
                Checkbox(
                  value: varon,
                  onChanged: (bool value) {
                    setState(() {

                      varon = value;
                    });
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Mujer"),
                    Checkbox(
                      value: mujer,
                      onChanged: (bool value) {
                        setState(() {
                          mujer = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        // Cuando el usuario pulsa el botón, muestra un diálogo de alerta con el
        // texto que el usuario ha digitado en nuestro campo de texto.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Recupera el texto que el usuario ha digitado utilizando nuestro
                // TextEditingController
                content: Text("tu nombre es : "+ myController.text+"\n tu edad es :"+myController2.text+"\n tu genero es: "+myController3.text),
                //child: Text(myController2.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );

  }

}