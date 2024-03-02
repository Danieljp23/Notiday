// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notiday/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:notiday/recuperasenha.dart';
import 'package:notiday/termos_politicas.dart';

class _Login extends State<Login> {
//função ja pré-estabelida pelo flutter que permiti interagir com textflied TEXTEDITINGCONTROLLER
  TextEditingController _permisaoLogin = TextEditingController();
  TextEditingController _permisaoSenha = TextEditingController();
  String login = '';
  String senha = '';
  bool _permisao = false;
  bool _permisaoS = false;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleSignIn() async {
    try {
      await googleSignIn.signIn();
      // O usuário está conectado.
      // Agora você pode usar googleSignIn.currentUser para obter os detalhes do usuário.
    } catch (error) {
      // Tratar erros de login.
      print('Erro ao efetuar login com o Google: $error');
    }
  }

  Future<void> _loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      print('Access Token: ${accessToken.token}');
      // Use accessToken para autenticar com o seu backend, realizar operações, etc.
    } else {
      print('Facebook login failed. Status: ${result.status}');
    }
  }

//função _permitir valores, faz a atualização através do setState dos valores das variáveis,
// e retorna se o text foi preenchido dentro do TextField..
  void _permitirLogin() {
    setState(() {
      _permisao = _permisaoLogin.text.isNotEmpty;
      _permisaoS = _permisaoSenha.text.isNotEmpty;
    });
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
              title: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Notiday(),
                    ),
                  );
                },
                color: Colors.black,
              ),
            ),
          ),
        ),

        //corpo do widget esta utilizando o center para centralizar os elementos.
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //container faz o dimensionamento do tamanho da imagem em 200 tamanho e 200 .
                Container(
                  margin: EdgeInsets.all(5),
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/notiday.png'),
                ),
                //texto descritivo do app
                Text(
                  "    Bem-Vindo ",
                  style: TextStyle(
                      fontFamily: AutofillHints.birthday,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                //nome do app

                // container para atribuir um padding e assegurar o tamanho dos elementos e conjuntos de widget.
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //padding para adicionar uma borda interna ao elemento de 4 pixels, utilizado em ambos TextField.
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          controller: _permisaoLogin,
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                            labelText: 'Login',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value) {
                            _permitirLogin();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          controller: _permisaoSenha,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          onChanged: (value) {
                            _permitirLogin();
                          },
                        ),
                      ),
                      Row(
                        //mainaxiAligmente para alinhar atraves do spaceEvenly,
                        // que faz alinhamento do centro para extremidade alinhando os espaços cimétricamente.
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //textbutton que vai direcionar ao e-mail para enviar a nova senha.
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => RecuperaSenha()),
                              );
                            },
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 243, 166, 0),
                                foregroundColor: Colors.black),
                            //através de 2 instancias da classe  TextEditingController,
                            //utilizamos duas variáveis para permitir o login, uma porta lógica AND para analisar ambos valores,
                            //e uma condição para verificar se dentro das variaveis foram atribuidos valores atraves do formulário.
                            onPressed: _permisao && _permisaoS ? () {} : null,
                            child: Text(
                              "Entrar",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //padding envolvendo elementos de uma row para determinar margens internas de 20 pixels.
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  //row fazendo alinhamento ao fim da tela com 3 elementos
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Iconbutton fazendo a conexão com login via faacebook.
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.blue,
                          size: 40.0,
                        ),
                        onPressed: _handleSignIn,
                      ),
                      //TextButton que ao clicar irá mostrar todos termos e política do aplicativo.
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => TermosPoliticas()),
                          );
                        },
                        child: Text('Termos e Políticas'),
                      ),
                      //IconButton fazendo a conexão com login através do Google.
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          size: 40.0,
                          color: Colors.blue,
                        ),
                        onPressed: _loginWithFacebook,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Class Login Stateful, que irá permitir a mudança dos elementos durante o uso do app.
class Login extends StatefulWidget {
  _Login createState() {
    return _Login();
  }
}
