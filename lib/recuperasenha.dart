import 'package:flutter/material.dart';
import 'package:notiday/login.dart';

class _RecuperaSenhaState extends State<RecuperaSenha> {
  _RecuperaSenhaState createState() {
    return _RecuperaSenhaState();
  }

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg_recuperasenha.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digite o e-mail da  conta:",
                  style: TextStyle(
                      fontFamily: AutofillHints.birthday,
                      color: Colors.black,
                      fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 18),
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 243, 166, 0),
                        foregroundColor: Colors.black),
                    onPressed: () {},
                    child: Text('Enviar e-mail'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecuperaSenha extends StatefulWidget {
  _RecuperaSenhaState createState() {
    return _RecuperaSenhaState();
  }
}
