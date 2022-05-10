//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/login.dart';
//import 'package:flutter_login/menu.dart';
//import 'authentication/auth.dart';
//import 'firebase_options.dart';



//import 'Pagina3.dart';
//import 'menu.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

// Ideal time to initialize
 runApp(MyApp());
//...
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silla de ruedas',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:const MyHomePage(title:"Prueba"),
      //home: const MyHomePage(title: 'Mi Primera APP'),
    );
  }
}


