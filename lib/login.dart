import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/authentication/auth.dart';
import 'package:flutter_login/menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //final _authClient = AuthenticationClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https://ouch-cdn2.icons8.com/GoqGFdzwq6ug0OkLtsiJmHBOASQ3UF686A9eitvOyrU/rs:fit:256:191/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDkw/Lzg4ZTNjNzNhLTNk/NzAtNDA2Yy1iYTJi/LTRmMjk5MDFlNjY1/MC5wbmc.png', scale: 3),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Ingrese Usuario",
                      labelText: "Usuario*"),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.key),
                      hintText: "Ingrese Contraseña",
                      labelText: "Password*"),
                      obscureText: true,

                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: FloatingActionButton.extended(
                      onPressed:(() {
                        if(login(_emailController.text,
                          _passwordController.text)){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (BuildContext context) => const Menu(),
                            )
                          );}
                        else{
                            showModalBottomSheet(
                            enableDrag: true,
                            elevation: 10.0,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 150,
                                  color: Colors.white10,
                                  child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                        Text(
                                          '¿No puedes ingresar?',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                       Text(
                                          'Valida tu usuario y contraseña.',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ])));
                            });
                        }       
                      }
                      ) 
                         /* async{
                        final User? user = await _authClient.loginUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                                if (user != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => Menu(),
                                  ),
                                  (route) => false,
                                );
                              } */
                      ,
                      label: const Text("Ingresar")),
                )
              ],
            ),
          ),
        ));
  }
}         