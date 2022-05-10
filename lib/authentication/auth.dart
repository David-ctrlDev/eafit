import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationClient {
  FirebaseAuth auth = FirebaseAuth.instance;

  registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      final UserCredential userCendential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCendential.user;
      await user!.updateDisplayName(name);
      user = auth.currentUser;
    } catch (e) {
      log(e.toString());
    }

    return user;
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
    } catch (e) {
      log(e.toString());
    }

    return user;
  }

  logoutUser() async {
    await auth.signOut();
  }
}

login(email,password){
  String user = 'wilder@gmail.com';
  String password1 = '123456';
  
  if( user == email && password1 == password){
    return true;
  }
  else{
    return false;
  }

}