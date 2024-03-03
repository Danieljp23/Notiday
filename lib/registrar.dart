import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notiday/login.dart';
import 'package:notiday/main.dart';

class _RegistrarState extends State<Registrar> {
  bool aceito = false;
  String senha = '';
  String confirmaSenha = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: AppBar(
              title: Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      color: Colors.black,
                    ),
                    SizedBox(width: 90.0),
                    Text(
                      'Notiday',
                      style: TextStyle(
                          fontFamily: AutofillHints.birthday,
                          fontSize: 30,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 600,
              height: 800,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 50),
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            labelText: 'NOME',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5.0),
                            ),
                            prefixIcon: Icon(Icons.person_2_outlined)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: 'SOBRENOME',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.perm_identity_outlined),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                        decoration: InputDecoration(
                          fillColor: Colors.blue,
                          labelText: 'E-MAIL',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: 'TELEFONE',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'SENHA',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          labelText: 'CONFIRMAR SENHA',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.check),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: aceito,
                          onChanged: (bool? checked) {
                            setState(() {
                              aceito = checked ?? false;
                            });
                          },
                        ),
                        Text('Concordo com os Termos e Políticas')
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 243, 166, 0),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: aceito
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            }
                          : null,
                      child: Text(
                        'Registrar',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Registrar extends StatefulWidget {
  _RegistrarState createState() {
    return _RegistrarState();
  }
}
